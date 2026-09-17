public with sharing class GerenciadorReservas {
    private EstadoConfirma estadoConfirma;
    private EstadoPendente estadoPendente;

    public GerenciadorReservas() {}


    public Mesa buscarDisponibilidade(List<Mesa> mesas, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo, Restaurante restaurante){
        MenorMesaViavel menorMesa = new MenorMesaViavel(restaurante);

        Mesa mesa = menorMesa.selecionarMesa(mesas, quant, local, periodo);

        if(mesa == null){ throw new IllegalArgumentException('Não há mesas disponiveis!'); }

        return mesa;
    }

    public void criarReserva(Cliente cliente, Restaurante restaurante, QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo, boolean aceitaListaEspera){ 
        Mesa disponivel = buscarDisponibilidade(restaurante.getMesas(), quant, local, periodo, restaurante);

        Reserva reserva = new Reserva(cliente, restaurante, quant, local, periodo, new EstadoPendente());

        if(disponivel == null && aceitaListaEspera){
            restaurante.getListaEspera().add(reserva);

        } else if(disponivel != null){
            estadoConfirma.confirmar(disponivel, reserva);

        } else {
            throw new IllegalArgumentException('Não há mesas disponiveis!');
        }

    }

    public void cancelarReserva(Reserva reserva, Restaurante restaurante){ 
        List<Reserva> espera = restaurante.getListaEspera();

        new EstadoCancela(reserva); 

        Reserva reservaPromovida = estadoPendente.regraPromocao(reserva, restaurante);

        Integer indice = findReserva(reservaPromovida, restaurante.getListaEspera());
        estadoPendente.promover(reservaPromovida, indice);   
    }

    private Integer findReserva(Reserva reserva, List<Reserva> reservas){

        for(Integer i = 0; i < reservas.size(); i++){
            if(reservas[i].mesa.getIdentificador() == reserva.mesa.getIdentificador()){
                return i;
            }
        }

        return null;
    }


}