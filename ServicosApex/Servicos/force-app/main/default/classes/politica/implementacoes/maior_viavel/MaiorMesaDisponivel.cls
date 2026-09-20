public with sharing class MaiorMesaDisponivel implements PoliticaAlocacaoMesa{
    private Mesa mesa;
    private List<Restaurante.Reserva> reservas;
    
    public MaiorMesaDisponivel(List<Restaurante.Reserva> reservas) {
        this.reservas = reservas;
    }
    
    public Mesa selecionarMesa(List<Mesa> mesas, 
    QuantidadePessoas quant, 
    LocalMesa local, 
    PeriodoReserva periodo){

        PoliticaPrioridadeSalao politica = new PoliticaPrioridadeSalao(this.reservas);
        
        mesas = politica.selecionarMesa(mesas, quant, local, periodo);
        
        if(!mesas.isEmpty()){
            Integer maior = mesas[0].getCapacidade();
            
            for(Mesa i: mesas){
                
                if(i.getCapacidade() == quant.getQuantidade() && i.getCapacidade() > maior){
                    this.mesa = i;
                    maior = i.getCapacidade();
                    
                }
            }
            
            return this.mesa;
            
        } else return null;
        
    }
    
    
}