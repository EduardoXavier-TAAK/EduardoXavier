public with sharing class GerenciadorAuxiliar {
    public GerenciadorAuxiliar() {}


    public boolean validarPromocao(Reserva reserva){

        if(listaEspera[i].getQuantidade().getQuantidade() <= reserva.getQuantidade().getQuantidade() && 
           listaEspera[i].getLocal() == reserva.getLocal() && 
           listaEspera[i].getPeriodo() == reserva.getPeriodo()){

            return true;
        }

            return false;
    }


    public Mesa filtroDisponiveis(List<Mesa> mesas, Restaurante restaurante){

        for(Integer i = mesas.size() - 1; i >= 0; i--){
            
            for(Reserva reserva : restaurante.getReservas()){

                if(reserva.getMesa() != null &&
                    mesas[i].numero.getIdentificador() == reserva.getMesa().numero.getIdentificador() &&
                    reserva.getStatus() == StatusReserva.CONFIRMADA &&
                    reserva.getPeriodo() == periodo)
                {
                    mesas.remove(i);
                    break;
                }
            }

            if(mesas.isEmpty()){ return null; }

            return mesas[0];
        }
    }


    public void adicionarReserva(List<Mesa> mesas, 
                                  Cliente cliente, 
                                  Restaurante restaurante, 
                                  QuantidadePessoas quant, 
                                  LocalMesa local, 
                                  PeriodoReserva periodo, 
                                  boolean aceitaListaEspera, 
                                  Mesa mesa){

        if(disponiveis.isEmpty() && aceitaListaEspera){

            Reserva newReserva = new Reserva(cliente,
                                            restaurante,
                                            mesa,
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

}