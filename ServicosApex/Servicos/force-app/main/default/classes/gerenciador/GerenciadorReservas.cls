public with sharing class GerenciadorReservas {
    private EstadoConfirma estadoConfirma;
    private EstadoPendente estadoPendente;
    
    public GerenciadorReservas() {
        this.estadoConfirma = new EstadoConfirma();
        this.estadoPendente = new EstadoPendente();
    }
    
    public Mesa buscarDisponibilidade(QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo, Restaurante restaurante){
        MenorMesaViavel menorMesa = new MenorMesaViavel(restaurante.getReservas());
        
        Mesa mesa = menorMesa.selecionarMesa(restaurante.getMesas(), quant, local, periodo);
        
        if(mesa == null){ throw new IllegalArgumentException('=> Gerenciador de Reservas: Não há mesas disponiveis!'); }
        
        return mesa;
    }
    
    public Restaurante.Reserva criarReserva(Cliente cliente,
    Restaurante restaurante,
    QuantidadePessoas quant,
    LocalMesa local,
    PeriodoReserva periodo,
    Boolean aceitaListaEspera){
        
        Mesa disponivel;
        
        try {
            disponivel = buscarDisponibilidade(quant, local, periodo, restaurante);
            
        } catch (IllegalArgumentException e) {
            if (aceitaListaEspera) { return new Restaurante.Reserva(cliente, restaurante, quant, local, periodo, new EstadoPendente()); }
            
        }
        
        return estadoConfirma.confirmar(new Restaurante.Reserva(cliente, restaurante, quant, disponivel, local, periodo, null));
    }

    
    public Restaurante.Reserva cancelarReserva(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        new EstadoCancela(reserva);
        
        Restaurante.Reserva reservaPromovida = this.estadoPendente.promover(reserva, listaEspera);
        
        return reservaPromovida;
        
    }
    
}