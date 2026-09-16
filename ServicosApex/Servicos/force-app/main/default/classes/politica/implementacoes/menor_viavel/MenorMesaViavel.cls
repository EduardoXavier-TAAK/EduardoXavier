public with sharing class MenorMesaViavel implements PoliticaAlocacaoMesa {
    private Mesa mesa;

    public MenorMesaViavel() { }

    public Mesa selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        
        if(!mesas.isEmpty()){
            
            Integer menor = mesas[0].getCapacidade();
            for(Mesa i: mesas){

                if((i.getCapacidade() >= quant.getQuantidade() && 
                                             i.local == local) && 
                                             i.getCapacidade() <= menor)
                {
                    this.mesa = i;
                    menor = i.getCapacidade();
                }

            }

            return this.mesa;

        } else {
            return null;
        }

    }


}