public with sharing class EstadoPendente extends EstadoReserva{
    private EstadoConfirma estadoConfirma;
    private PoliticaPromocao promocao;
    
    public EstadoPendente() {
        this.estadoConfirma = new EstadoConfirma();
        this.promocao = new PoliticaPromocao();
    }
    
    public Restaurante.Reserva promover(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        Restaurante.Reserva newReserva = this.promocao.regraPromocao(reserva, listaEspera);
        
        if(newReserva != null){
            return this.estadoConfirma.confirmar(newReserva);
        } else {
            System.debug('Não foi encontrada reserva adequada na lista de espera.');
            return null;
        }
    }
    
    public void cancelar(Restaurante.Reserva reserva){ new EstadoCancela(reserva); }
    
    
}