public with sharing class PoliticaPrioridadeSalao implements PoliticaAlocacaoMesa{
    private Mesa mesa;
    private Restaurante restaurante;

    public PoliticaPrioridadeSalao(Restaurante restaurante) {
        this.restaurante = restaurante;
    }

    public List<Mesa> selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){ 
        List<Mesa> disponiveis = iteracao(mesas, quant, LocalMesa.SALAO, periodo);

        if(disponiveis.isEmpty()){ disponiveis = iteracao(mesas, quant, LocalMesa.JARDIM, periodo); }

        return disponiveis;
    }


    private List<Mesa> iteracao(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        List<Mesa> result = new List<Mesa>();
        List<Reserva> reservas = this.restaurante.getReservas();

        for(Mesa i : mesas){
            if(i.getCapacidade() <= quant.getQuantidade() && i.local == local){

                for(Reserva j: reservas){
                    if((i.getIdentificador() == j.mesa.getIdentificador() &&
                        j.getPeriodo() == periodo) && 
                        j.status instanceof EstadoConfirma){
                            break;
                        }
                }

                result.add(i);
            }
        }

        return result;
    }
        
}