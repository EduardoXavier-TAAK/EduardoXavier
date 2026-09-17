public with sharing class MenorMesaViavel implements PoliticaAlocacaoMesa {
    private Mesa mesa;
    private Restaurante restaurante;

    public MenorMesaViavel(Restaurante restaurante) { 
        this.restaurante = restaurante;
    }

    public Mesa selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        PoliticaPrioridadeSalao politica = new PoliticaPrioridadeSalao(this.restaurante);

        mesas = politica.selecionarMesa(mesas, quant, local, periodo);

        if(!mesas.isEmpty()){  
            Integer menor = mesas[0].getCapacidade();
            
            for(Mesa i: mesas){

                if((i.getCapacidade() >= quant.getQuantidade() && i.local == local) && i.getCapacidade() <= menor){

                    this.mesa = i;
                    menor = i.getCapacidade();

                }
            }

            return this.mesa;

        } else return null; 

    }


}