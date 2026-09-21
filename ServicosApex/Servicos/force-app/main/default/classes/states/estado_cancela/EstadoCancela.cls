public with sharing class EstadoCancela extends EstadoReserva {
    
    public EstadoCancela(Restaurante.Reserva reserva) {

        if(reserva.status instanceof EstadoCancela){
            System.debug('Reserva já cancelada');
        } else {
            reserva.status = this;
        }       
    }
    
}