public with sharing class PoliticaPromocao implements PoliticaPromocaoListaEspera{
    private GerenciadorReservas gerenciador;
    
    public PoliticaPromocao() {}
    
    public Restaurante.Reserva regraPromocaoCancelamento(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        
        if(listaEspera.isEmpty()){
            return null;
        }
        
        for(Integer i = 0; i < listaEspera.size(); i++){
            
            if(verificarIf(listaEspera[i], reserva)){
                
                if(listaEspera[i].status instanceof EstadoCancela){
                    continue;
                } else {
                    Restaurante.Reserva newReserva = listaEspera[i];
                    newReserva.mesa = reserva.mesa;
                    listaEspera.remove(i);
                    return newReserva;
                    
                }
            }
        }
        
        return null;
    }
    
    
    public Restaurante.Reserva regraPromocaoAddMesa(List<Restaurante.Reserva> listaEspera, Mesa mesa){
        
        if(listaEspera.isEmpty()){
            return null;
        }
        
        for(Integer i = 0; i < listaEspera.size(); i++){
            
            if(listaEspera[i].getQuantidade() <= mesa.getCapacidade() && listaEspera[i].getLocal() == mesa.getLocal()){
                
                if(listaEspera[i].status instanceof EstadoCancela){
                    continue;
                } else {
                    Restaurante.Reserva newReserva = listaEspera[i];
                    newReserva.mesa = mesa;
                    listaEspera.remove(i);
                    return newReserva;
                    
                }
            }
        }
        
        return null;
        
    }
    
    
    private Boolean verificarIf(Restaurante.Reserva reserva1, Restaurante.Reserva reserva2){
        if((reserva1.getQuantidade() <= reserva2.mesa.getCapacidade() && reserva1.getPeriodo() == reserva2.getPeriodo()) && reserva1.getLocal() == reserva2.getLocal()){
            return true;
        }
        return false;
    }
}