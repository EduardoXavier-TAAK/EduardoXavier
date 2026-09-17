public with sharing class RelatorioReservasService {

    public RelatorioReservasService() {   }

    
    public Map<String, List<Reserva>> relatorioRestaurante(Restaurante restaurante){
        Map<String, List<Reserva>> reservasConfirmadas = new Map<String, List<Reserva>>();
        
        for(Reserva i : restaurante.getReservas()){

            if(i.status instanceof EstadoConfirma){
                String cpf = i.getCliente().getCPF();

                if(reservasConfirmadas.containsKey(cpf)){
                    reservasConfirmadas.get(cpf).add(i);

                } else {
                    reservasConfirmadas.put(cpf, new List<Reserva>{i});
                }

            }
        }

        for(String i : reservasConfirmadas.keySet()){
            List<Reserva> reservas = reservasConfirmadas.get(i);

            System.debug('Cliente: ' + i + '|' + ' Reservas: ' + reservas.size());
        }

        return reservasConfirmadas;
    }

    public void relatoriosAll(List<Restaurante> restaurantes){

        for(Restaurante i : restaurantes){
            System.debug('---------------------- ' + i.getNome()+ ' ----------------------');
            relatorioRestaurante(i);
        }
    }

}