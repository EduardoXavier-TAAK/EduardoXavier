public with sharing class MesaDuplicada {
    public MesaDuplicada() {}
    
    public void mesasDuplicadas(List<Mesa> mesas){

        for(Integer i = 0; i < mesas.size(); i++){
            for(Integer j = i + 1; j <= mesas.size() - 1; j++){ 
                if(mesas[i].numero.getIdentificador() == mesas[j].numero.getIdentificador()){ 
                    throw new IllegalArgumentException('Numero de mesa duplicado!'); 
                }
            }
        }
    }


    public void mesaDuplicada(List<Mesa> mesas, Mesa mesa){

        for(Mesa i : this.mesas){ 
                if(i.numero.getIdentificador() == mesa.numero.getIdentificador()){  
                    throw new IllegalArgumentException('Numero de mesa já cadastrado!'); 
            } 
        }

    }
}

