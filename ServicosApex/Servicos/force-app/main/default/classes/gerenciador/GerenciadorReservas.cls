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
        
        if(mesa == null){ throw new IllegalArgumentException('Não há mesas disponiveis! - ' + restaurante.getNome()); }
        
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
            System.debug(e.getMessage());
            
            if (aceitaListaEspera) {
                return new Restaurante.Reserva(cliente, restaurante, quant, local, periodo, new EstadoPendente());
                
            } else { throw new IllegalArgumentException('Reserva não foi registrada por indisponibilidade de mesas! '); }
            
        }
        
        return estadoConfirma.confirmar(new Restaurante.Reserva(cliente,
        restaurante, quant, disponivel, local, periodo, null));
    }
    
    
    public Restaurante.Reserva cancelarReserva(Restaurante.Reserva reserva, List<Restaurante.Reserva> listaEspera){
        new EstadoCancela(reserva);
        
        if(reserva.mesa != null){
            Restaurante.Reserva reservaPromovida = this.estadoPendente.promover(reserva, listaEspera);
            
            reservaPromovida = verificarPromocao(reservaPromovida);
            System.debug('Reserva Promovida! - ' + reservaPromovida.getCliente().getNome());
            return reservaPromovida;
        }
        
        throw new IllegalArgumentException('Reserva em lista de espera cancelada!');
    }
    
    public Restaurante.Reserva promocaoAddMesa(List<Restaurante.Reserva> listaEspera, Mesa mesa){
        Restaurante.Reserva newReserva = estadoPendente.promoverAddMesa(listaEspera, mesa);
        
        return verificarPromocao(newReserva);
    }
    
    private Restaurante.Reserva verificarPromocao(Restaurante.Reserva reserva){
        if(reserva != null){ return reserva; }
        
        throw new IllegalArgumentException('Promoção automatica: Não há reservas compativeis com essa mesa na lista de espera!');
    }
}