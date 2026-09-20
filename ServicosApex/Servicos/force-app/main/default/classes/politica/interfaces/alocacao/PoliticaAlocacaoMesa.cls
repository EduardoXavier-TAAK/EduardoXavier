public interface PoliticaAlocacaoMesa {

    Object selecionarMesa(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo);

}