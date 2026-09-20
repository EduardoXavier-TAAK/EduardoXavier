public with sharing class RelatorioReservasService {
    
    public RelatorioReservasService() {   }
    
    
    public Map<String, List<Restaurante.Reserva>> relatorioRestaurante(List<Restaurante.Reserva> reservas){
        Map<String, List<Restaurante.Reserva>> reservasConfirmadas = new Map<String, List<Restaurante.Reserva>>();
        
        for(Restaurante.Reserva i : reservas){
            
            if(i.status instanceof EstadoConfirma){
                String cpf = i.getCliente().getCPF();
                
                if(reservasConfirmadas.containsKey(cpf)){
                    reservasConfirmadas.get(cpf).add(i);
                    
                } else {
                    reservasConfirmadas.put(cpf, new List<Restaurante.Reserva>{i});
                }
                
            }
        }
        
        List<Restaurante.Reserva> temp = new List<Restaurante.Reserva>();
        
        for(String i : reservasConfirmadas.keySet()){
            temp = reservasConfirmadas.get(i);
            
            for(Restaurante.Reserva j : temp){

                System.debug('Cliente: ' + i + ' -' + ' Reservas: ' +
                    j.getRestaurante().getNome() + ' - Mesa:' + j.mesa.getCapacidade());
            }
        }
        
        return reservasConfirmadas;
    }
    
    public void relatoriosAll(List<Restaurante> restaurantes){
        
        for(Restaurante i : restaurantes){
            System.debug('---------------------- ' + i.getNome()+ ' ----------------------');
            
            relatorioRestaurante(i.getReservas());
        }
    }
    
}