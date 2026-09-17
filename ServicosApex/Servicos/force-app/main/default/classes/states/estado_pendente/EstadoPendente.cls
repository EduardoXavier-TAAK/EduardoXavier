public with sharing class EstadoPendente extends EstadoReserva implements PoliticaPromocaoListaEspera{
    private EstadoConfirma estadoConfirma;
    private Mesa mesa;

    public EstadoPendente() {}

    public void promover(Reserva reserva, Integer i){
        verificar(reserva);
       
        estadoConfirma.confirmar(mesa, reserva);

        reserva.getRestaurante().
                getListaEspera().
                remove(i);
    }

    public Reserva regraPromocao(Reserva reserva, Restaurante restaurante){
        List<Reserva> espera = restaurante.getListaEspera();

        for(Integer i = espera.size() - 1; i >= 0; i--){
            if((espera[i].mesa.getCapacidade() == reserva.mesa.getCapacidade() && 
                espera[i].getPeriodo() == reserva.getPeriodo()) &&
                espera[i].getLocal() == reserva.getLocal()){

                    if(espera[i].status instanceof EstadoCancela){
                        continue;
                    } else {   
                        return espera[i];
                    }
               }
        }

        return null;
    }

    public void cancelar(Reserva reserva){ new EstadoCancela(reserva); }


}