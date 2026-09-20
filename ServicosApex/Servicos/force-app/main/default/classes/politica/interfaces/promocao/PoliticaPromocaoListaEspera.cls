public interface PoliticaPromocaoListaEspera {
    
    Restaurante.Reserva regraPromocaoCancelamento(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera);

    Restaurante.Reserva regraPromocaoAddMesa(List<Restaurante.Reserva> listaEspera, Mesa mesa);

}