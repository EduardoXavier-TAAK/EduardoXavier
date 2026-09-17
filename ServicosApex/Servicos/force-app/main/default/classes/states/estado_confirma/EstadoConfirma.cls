public with sharing class EstadoConfirma extends EstadoReserva {
    private EstadoPendente pendente;

    public EstadoConfirma() {  }

    public void confirmar(Mesa mesa, Reserva reserva) {

        verificar(reserva);

        if(mesa == null){ throw new IllegalArgumentException('Não há mesas disponiveis!'); }

        reserva.status = new EstadoConfirma();
        reserva.mesa = mesa;

        reserva.getRestaurante().getListaEspera().add(reserva);
    }


    public void cancelar(Reserva reserva){ new EstadoCancela(reserva); }
}