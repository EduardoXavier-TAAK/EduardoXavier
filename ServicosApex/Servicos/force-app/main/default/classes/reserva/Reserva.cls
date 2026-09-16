public with sharing class Reserva {
        private Cliente cliente;
        private Restaurante restaurante;
        private QuantidadePessoas quantidadePessoas;
        private LocalMesa localPreferencia;
        private PeriodoReserva periodo;
        public StatusReserva status;
        public Mesa mesa;
        

        public Reserva(Cliente cliente, 
                            Restaurante restaurante, 
                            QuantidadePessoas quantidadePessoas, 
                            LocalMesa localPreferencia, 
                            PeriodoReserva periodo,
                            StatusReserva status
                        ) 
        {
            this.cliente = cliente;
            this.restaurante = restaurante;
            this.quantidadePessoas = quantidadePessoas;
            this.localPreferencia = localPreferencia;
            this.restaurante = restaurante;
            this.periodo = periodo;
            this.status = status;
        }

        public Reserva(Cliente cliente, 
                            Restaurante restaurante, 
                            Mesa mesa, 
                            QuantidadePessoas quantidadePessoas, 
                            LocalMesa localPreferencia, 
                            PeriodoReserva periodo,
                            StatusReserva status
                        ) 
        {
            this.cliente = cliente;
            this.restaurante = restaurante;
            this.mesa = mesa;
            this.quantidadePessoas = quantidadePessoas;
            this.localPreferencia = localPreferencia;
            this.restaurante = restaurante;
            this.periodo = periodo;
            this.status = status;
        }

        public Cliente getCliente(){ return this.cliente; }

        public Restaurante getRestaurante(){ return this.restaurante; }

        public Mesa getMesa(){ return this.mesa; }

        public QuantidadePessoas getQuantidade(){ return this.quantidadePessoas; }

        public LocalMesa getLocal(){ return this.localPreferencia; }

        public PeriodoReserva getPeriodo(){ return this.periodo; }

        public StatusReserva getStatus(){ return this.status; }
    }

