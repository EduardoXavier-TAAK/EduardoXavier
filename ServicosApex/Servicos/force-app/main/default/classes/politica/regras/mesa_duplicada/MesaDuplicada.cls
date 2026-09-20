public with sharing class MesaDuplicada {
    public MesaDuplicada() {}
    
    public void mesasDuplicadas(List<Mesa> mesas){
        
        for(Integer i = 0; i < mesas.size(); i++){
            for(Integer j = i + 1; j <= mesas.size() - 1; j++){
                if(mesas[i].getIdentificador() == mesas[j].getIdentificador()){
                    throw new IllegalArgumentException('Numero de mesa duplicado!');
                }
            }
        }
    }
    
    
    public void mesaDuplicada(List<Mesa> mesas, Mesa mesa){     
        for(Mesa i : mesas){
            if(i.getIdentificador() == mesa.getIdentificador()){
                throw new IllegalArgumentException('Numero de mesa já cadastrado!');
            }
        }  
    }
}