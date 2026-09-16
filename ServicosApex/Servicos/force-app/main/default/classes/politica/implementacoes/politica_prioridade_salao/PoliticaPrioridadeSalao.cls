public with sharing class PoliticaPrioridadeSalao implements PoliticaAlocacaoMesa{
    private Restaurante resturante;

    public PoliticaPrioridadeSalao(Restaurante resturante) {
        this.resturante = resturante;
    }

    Mesa selecionarMesa(List<Reserva> reserva, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){   
        return null; }

}   