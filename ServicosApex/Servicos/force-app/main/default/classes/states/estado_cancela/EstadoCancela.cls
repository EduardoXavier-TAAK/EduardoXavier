public with sharing class EstadoCancela extends EstadoReserva {

    public EstadoCancela(Reserva reserva) { reserva.status = this; }

}