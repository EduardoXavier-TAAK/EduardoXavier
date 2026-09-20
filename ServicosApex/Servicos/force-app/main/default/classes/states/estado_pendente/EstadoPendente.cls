public with sharing class EstadoPendente extends EstadoReserva{
    private EstadoConfirma estadoConfirma;
    private PoliticaPromocao promocao;
    
    public EstadoPendente() {
        this.estadoConfirma = new EstadoConfirma();
        this.promocao = new PoliticaPromocao();
    }
    
    public Restaurante.Reserva promover(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        Restaurante.Reserva newReserva = this.promocao.regraPromocaoCancelamento(reserva, listaEspera);
        
        return verificacao(newReserva);
    }

    public Restaurante.Reserva promoverAddMesa(List<Restaurante.Reserva> listaEspera, Mesa mesa){
        Restaurante.Reserva newReserva = this.promocao.regraPromocaoAddMesa(listaEspera, mesa);
        
        return verificacao(newReserva);
    }

    private Restaurante.Reserva verificacao(Restaurante.Reserva reserva){
 
        if(reserva != null){
            return this.estadoConfirma.confirmar(reserva);
        } else {
            return null;
        }

    }
    
    public void cancelar(Restaurante.Reserva reserva){ new EstadoCancela(reserva); }
    
}