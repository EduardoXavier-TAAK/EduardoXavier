public with sharing class PoliticaPromocao implements PoliticaPromocaoListaEspera{
    public PoliticaPromocao() {}
    
    public Restaurante.Reserva regraPromocao(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        
        if(listaEspera.isEmpty()){
            System.debug('Politica Promoção => Lista de espera vazia! ');
            return null;
        }
        
        for(Integer i = 0; i < listaEspera.size(); i++){
            
            if((listaEspera[i].getQuantidade() <= reserva.mesa.getCapacidade() &&
                listaEspera[i].getPeriodo() == reserva.getPeriodo()) &&
                listaEspera[i].getLocal() == reserva.getLocal()){
                
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
        
        System.debug('=> Politica de Promoção: Nenhuma reserva adequada foi encontrada.');
        return null;
    }
}
