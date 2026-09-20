public with sharing class EstadoConfirma extends EstadoReserva {
    
    public EstadoConfirma() { }
    
    public Restaurante.Reserva confirmar(Restaurante.Reserva reserva) {
        try{
            this.verificar(reserva);
            
            reserva.status = new EstadoConfirma();
            
            return reserva;
            
        }catch(IllegalArgumentException e){
            System.debug(e.getMessage());
            return null;
        }
    }
    
    public void cancelar(Restaurante.Reserva reserva){ new EstadoCancela(reserva); }
}