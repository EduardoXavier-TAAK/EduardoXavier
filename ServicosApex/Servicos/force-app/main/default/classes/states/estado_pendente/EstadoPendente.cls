public with sharing class EstadoPendente extends EstadoReserva{
    public EstadoPendente() {}
    
    public Restaurante.Reserva promover(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        Restaurante.Reserva newReserva = new PoliticaPromocao().regraPromocaoCancelamento(reserva, listaEspera);
        
        return verificacao(newReserva);
    }
    
    public Restaurante.Reserva promoverAddMesa(List<Restaurante.Reserva> listaEspera, Mesa mesa){
        Restaurante.Reserva newReserva = new PoliticaPromocao().regraPromocaoAddMesa(listaEspera, mesa);
        
        return verificacao(newReserva);
    }
    
    private Restaurante.Reserva verificacao(Restaurante.Reserva reserva){
        
        if(reserva != null){
            return new EstadoConfirma().confirmar(reserva);

        } else { return null; }
        
    }
    
    public void cancelar(Restaurante.Reserva reserva){ new EstadoCancela(reserva); }
    
}