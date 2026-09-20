public with sharing class Restaurante {
    private List<Restaurante.Reserva> reservas;
    private List<Restaurante.Reserva> listaEspera;
    private List<Mesa> mesas;
    private String nome;
    private String endereco;
    private MesaDuplicada duplicadas;
    private GerenciadorReservas gerenciador;
    private EstadoPendente pendente;
    
    
    public Restaurante(String nome, String endereco, List<Mesa> mesas) {
        this.duplicadas = new MesaDuplicada();
        this.reservas = new List<Restaurante.Reserva>();
        this.listaEspera = new List<Restaurante.Reserva>();
        this.gerenciador = new GerenciadorReservas();
        this.nome = nome;
        this.endereco = endereco;
        
        duplicadas.mesasDuplicadas(mesas);
        this.mesas = mesas;
    }
    
    public void adicionarMesa(Mesa mesa) {
        
        duplicadas.mesaDuplicada(this.mesas, mesa);

        try{
            Restaurante.Reserva reservaPromovida = gerenciador.promocaoAddMesa(this.listaEspera, mesa);

        } catch (IllegalArgumentException e){ System.debug(e.getMessage()); }

        this.mesas.add(mesa);
    }
    
    
    public void confirmarReserva(Cliente cliente, QuantidadePessoas quant, LocalMesa local,
    PeriodoReserva periodo, Boolean aceitaListaEspera){

        try {
            Restaurante.Reserva reserva = gerenciador.criarReserva(cliente,
            this,
            quant,
            local,
            periodo,
            aceitaListaEspera);
                
            if(reserva.status instanceof EstadoPendente){
                this.listaEspera.add(reserva);
                System.debug('Reserva adicionada a lista de espera! ');
                return;
            } else {
                this.reservas.add(reserva);
            }

            System.debug('Reserva Confirmada: ' +
                reserva.getRestaurante().getNome() + ' - ' + reserva.getCliente().getNome());

        } catch (Exception e){ System.debug(e.getMessage()); }
        
    }
    
    
    public void cancelaReserva(Restaurante.Reserva reserva){ 
        try{
            this.reservas.add(gerenciador.cancelarReserva(reserva, this.listaEspera));

        } catch (IllegalArgumentException e){ System.debug(e.getMessage()); }
 
    }
    
    
    public Mesa buscarMesa(QuantidadePessoas quant, LocalMesa local, PeriodoReserva periodo){
        return gerenciador.buscarDisponibilidade(quant, local, periodo, this);
    }
    
    public String getNome(){ return this.nome; }
    
    public String getEndereco(){ return this.endereco; }
    
    public List<Mesa> getMesas(){ return this.mesas; }
    
    public List<Reserva> getReservas(){ return new List<Restaurante.Reserva>(this.reservas); }

    public List<Reserva> getListaEspera(){ return new List<Restaurante.Reserva>(this.listaEspera); }
    
    public with sharing class Reserva {
        private Cliente cliente;
        private Restaurante restaurante;
        private QuantidadePessoas quantidadePessoas;
        private LocalMesa localPreferencia;
        private PeriodoReserva periodo;
        private Datetime registro;
        public EstadoReserva status;
        public Mesa mesa;
        
        
        public Reserva(Cliente cliente,
        Restaurante restaurante,
        QuantidadePessoas quantidadePessoas,
        Mesa mesa,
        LocalMesa localPreferencia,
        PeriodoReserva periodo,
        EstadoReserva status
            )
        {
            this.cliente = cliente;
            this.restaurante = restaurante;
            this.mesa = mesa;
            this.quantidadePessoas = quantidadePessoas;
            this.localPreferencia = localPreferencia;
            this.periodo = periodo;
            this.status = status;
            this.registro = Datetime.now();
        }
        
        
        public Reserva(Cliente cliente,
        Restaurante restaurante,
        QuantidadePessoas quantidadePessoas,
        LocalMesa localPreferencia,
        PeriodoReserva periodo,
        EstadoReserva status
            )
        {
            this.cliente = cliente;
            this.restaurante = restaurante;
            this.mesa = null;
            this.quantidadePessoas = quantidadePessoas;
            this.localPreferencia = localPreferencia;
            this.restaurante = restaurante;
            this.periodo = periodo;
            this.status = status;
            this.registro = Datetime.now();
        }
        
        public Cliente getCliente(){ return this.cliente; }
        
        public Restaurante getRestaurante(){ return this.restaurante; }
        
        public Integer getQuantidade(){ return this.quantidadePessoas.getQuantidade(); }
        
        public LocalMesa getLocal(){ return this.localPreferencia; }
        
        public PeriodoReserva getPeriodo(){ return this.periodo; }
        
        public DateTime getDataDeRegistro(){ return this.registro; }
        
    }
    
}