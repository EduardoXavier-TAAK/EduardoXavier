public with sharing class MaiorMesaDisponivel implements PoliticaAlocacaoMesa{
    private Mesa mesa;

    public MaiorMesaDisponivel() { 
    }


    Mesa selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        
        if(!mesas.isEmpty()){

            Integer maior = mesas[0].getCapacidade();
            for(Mesa i: mesas){

                if((i.getCapacidade() >= quant.getQuantidade() && 
                                             i.local == local) && 
                                             (maior < i.getCapacidade()))
                {
                    this.mesa = i;
                    maior = i.getCapacidade();
                }

            }

            return this.mesa;

        } else {
            throw new IllegalArgumentException('Não há mesas!');
        }

    }


}