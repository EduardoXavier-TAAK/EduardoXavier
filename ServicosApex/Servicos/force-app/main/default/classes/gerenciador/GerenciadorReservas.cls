public with sharing class GerenciadorReservas {
    public GerenciadorReservas() {}


    public List<Mesa> buscarDisponibilidade(Restaurante res, QuantidadePessoas quantidade, LocalMesa local){
        MenorMesaViavel menorMesa = new MenorMesaViavel();
        List<Mesa> restMesas = res.getMesas();
        List<Mesa> disponiveis = new List<Mesa>();

        for(Integer i = 0; i < restMesas.size(); i++){
            Mesa mesa = menorMesa.selecionarMesa(restMesas, quantidade, local, null);
            
            if(mesa != null){
                disponiveis.add(mesa);
                restMesas.remove(i);
                i--;

            } else { break; }
        }

        if(disponiveis.isEmpty()){ throw new ListException('Não há mesas!'); }


        return disponiveis;
    }   

    public void criarReserva(Cliente cliente, Restaurante restaurante, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo, boolean aceitaListaEspera){
        List<Mesa> disponiveis = buscarDisponibilidade(restaurante, quant, local);
        
        if(disponiveis.isEmpty()){ 
            throw new IllegalArgumentException('Não há mesas disponíveis!');
        }

        for(Integer i = disponiveis.size() - 1; i >= 0; i--){
            
            for(Reserva reserva : restaurante.getReservas()){

                if(reserva.getMesa() != null &&
                    disponiveis[i].numero.getIdentificador() == reserva.getMesa().numero.getIdentificador() &&
                    reserva.getStatus() == StatusReserva.CONFIRMADA &&
                    reserva.getPeriodo() == periodo)
                {
                    disponiveis.remove(i);
                    break;
                }
            }
        }

        if(disponiveis.isEmpty() && aceitaListaEspera){

            Reserva newReserva = new Reserva(cliente,
                                restaurante,
                                null,
                                quant,
                                local,
                                periodo,
                                StatusReserva.CONFIRMADA);

            restaurante.getListaEspera().add(newReserva);

        } else if(disponiveis.isEmpty()){
            throw new IllegalArgumentException('Não há mesas disponiveis para esse periodo!'); 

        } else {
            
            Reserva newReserva = new Reserva(cliente,
                                            restaurante,
                                            disponiveis[0],
                                            quant,
                                            local,
                                            periodo,
                                            StatusReserva.CONFIRMADA);

            restaurante.getReservas().add(newReserva);
        }
    }

    public void cancelarReserva(Reserva reserva){
        reserva.status = StatusReserva.CANCELADA;
        List<Reserva> reservas = reserva.getRestaurante().getReservas();
        List<Reserva> listaEspera = reserva.getRestaurante().getListaEspera();

        for(Integer i = 0; i < listaEspera.size(); i++){
            if(listaEspera[i].getQuantidade() <= reserva.getQuantidade() &&
                listaEspera[i].getLocal() == reserva.getLocal() &&
                listaEspera[i].getPeriodo() == reserva.getPeriodo())
            {
                listaEspera[i].status = StatusReserva.CONFIRMADA;
                listaEspera[i].mesa = reserva.getMesa();
                reserva.getRestaurante().getReservas().add(listaEspera[i]);
                reserva.getRestaurante().getListaEspera().remove(i);
                break;
            }   
        }
    }
}