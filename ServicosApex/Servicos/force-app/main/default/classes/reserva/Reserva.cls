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

        public QuantidadePessoas getQuantidade(){ return this.quantidadePessoas; }

        public LocalMesa getLocal(){ return this.localPreferencia; }

        public PeriodoReserva getPeriodo(){ return this.periodo; }

        public DateTime getDataDeRegistro(){ return this.registro; }

    }

