public with sharing class EstadoCancela extends EstadoReserva {

    public EstadoCancela(Restaurante.Reserva reserva) { reserva.status = this; }

}