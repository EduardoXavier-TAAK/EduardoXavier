public with sharing class GerenciadorReservas {
    private static GerenciadorAuxiliar auxiliar;

    public GerenciadorReservas() {}


    public List<Mesa> buscarDisponibilidade(Restaurante res, QuantidadePessoas quantidade, LocalMesa local){
        List<Mesa> restMesas = res.getMesas();
        List<Mesa> disponiveis = new List<Mesa>();
        
        MenorMesaViavel menorMesa = new MenorMesaViavel();

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

        if(disponiveis.isEmpty()) throw new IllegalArgumentException('Não há mesas disponíveis!'); 


        adicionarReserva(cliente, 
                         restaurante, 
                         quant, 
                         local, 
                         periodo, 
                         aceitaListaEspera, 
                         auxiliar.filtroDisponiveis(disponiveis, restaurante));
    }

    public void cancelarReserva(Reserva reserva){

        reserva.status = StatusReserva.CANCELADA;
        List<Reserva> reservas = reserva.getRestaurante().getReservas();
        List<Reserva> listaEspera = reserva.getRestaurante().getListaEspera();

        for(Integer i = 0; i < listaEspera.size(); i++){

            if(auxiliar.validarPromocao(reserva)){
                listaEspera[i].status = StatusReserva.CONFIRMADA;

                listaEspera[i].mesa = reserva.getMesa();
                reservas.add(listaEspera[i]);
                listaEspera.remove(i);
                break;
            }   

        }
    }


}