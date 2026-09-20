public with sharing class EstadoConfirma extends EstadoReserva {

    public EstadoConfirma() { }

    public Restaurante.Reserva confirmar(Restaurante.Reserva reserva) {
        this.verificar(reserva);

        reserva.status = new EstadoConfirma();

        return reserva;
    }

    public void cancelar(Restaurante.Reserva reserva){ new EstadoCancela(reserva); }
}