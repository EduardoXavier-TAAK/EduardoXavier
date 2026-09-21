public with sharing class PoliticaPrioridadeSalao implements PoliticaAlocacaoMesa{
    private List<Restaurante.Reserva> reservas;
    
    public PoliticaPrioridadeSalao(List<Restaurante.Reserva> reservas) {
        this.reservas = reservas;
    }
    
    public List<Mesa> selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        
        List<Mesa> disponiveis = new List<Mesa>();
        
        if(!this.reservas.isEmpty()) {
            for(Mesa i : mesas){
                if(i.getCapacidade() < quant.getQuantidade() || i.getLocal() != local){ continue; }
                
                Boolean ocupada = false;
                
                for(Restaurante.Reserva j: this.reservas){
                    
                    if((i.getIdentificador() == j.mesa.getIdentificador() && j.getPeriodo() == periodo) && j.status instanceof EstadoConfirma){
                        ocupada = true;
                        break;
                    }
                }
                
                if(!ocupada){
                    disponiveis.add(i);
                }
            }
            
            return disponiveis;
            
        } else {
            
            for(Mesa i: mesas){
                
                if(i.getCapacidade() < quant.getQuantidade() || i.getLocal() != local){ continue; }
                
                disponiveis.add(i);
            }
            
            return disponiveis;
        }
    }
}