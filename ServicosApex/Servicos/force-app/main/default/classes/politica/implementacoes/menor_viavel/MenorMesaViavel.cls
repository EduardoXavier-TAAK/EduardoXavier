public with sharing class MenorMesaViavel implements PoliticaAlocacaoMesa {
    private Mesa mesa;
    private List<Restaurante.Reserva> reservas;
    
    public MenorMesaViavel(List<Restaurante.Reserva> reservas) {
        this.reservas = reservas;
    }
    
    public Mesa selecionarMesa(List<Mesa> mesas, 
    QuantidadePessoas quant, 
    LocalMesa local, 
    PeriodoReserva periodo){

        PoliticaPrioridadeSalao politica = new PoliticaPrioridadeSalao(this.reservas);

        if(mesas.isEmpty()){ System.debug('Restaurante não tem mesas registradas! '); }

        mesas = politica.selecionarMesa(mesas, quant, local, periodo);
        
        
        if(!mesas.isEmpty()){
            Integer menor = mesas[0].getCapacidade();
            
            this.mesa = mesas[0];
            for(Mesa i: mesas){
                
                if(i.getCapacidade() < menor){
                    this.mesa = i;
                    menor = i.getCapacidade();
                    
                }
            }
            
            return this.mesa;
            
        } else return null;
        
    }
    
    
}