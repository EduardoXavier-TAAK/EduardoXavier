public abstract class EstadoReserva {
    
    public EstadoReserva() {}

    protected void verificar(Restaurante.Reserva reserva){
        
        if (reserva.status instanceof EstadoConfirma) {
            throw new IllegalArgumentException('Reserva já confirmada!');
            
        } else if (reserva.status instanceof EstadoCancela) {
            throw new IllegalArgumentException('Essa reserva foi cancelada!');
        }
    }
    
    protected void confirmar(){}
    protected void cancelar(){}
    
}