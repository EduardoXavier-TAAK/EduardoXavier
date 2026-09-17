Map<String, Object> payloadRestaurante = new Map<String, Object>{
    'nome' => 'Pizzaria do Bairro',
    'endereco' => 'Rua das Flores, 120',
    'reservas' => new List<Object>(),
    'listaEspera' => new List<Object>(),
    'mesas' => new List<Object>{
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 1 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 2 },
            'local' => 'SALAO'
        },
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 2 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 4 },
            'local' => 'JARDIM'
        },
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 3 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 6 },
            'local' => 'SALAO'
        }
    }
};

Restaurante restaurante = (Restaurante) JSON.deserialize(JSON.serialize(payloadRestaurante), Restaurante.class);
System.debug('Restaurante montado: ' + restaurante.getNome() + ' | Mesas: ' + restaurante.getMesas().size());

Cliente cliente1 = new Cliente('Ana Silva', cpfValido);
Cliente cliente2 = new Cliente('Bruno Costa', new Documento('98765432100'));

Reserva reservaConfirmada = new Reserva(
    cliente1,
    restaurante,
    new QuantidadePessoas(2),
    LocalMesa.SALAO,
    PeriodoReserva.MANHA,
    new EstadoPendente()
);

Mesa mesaParaConfirmacao = restaurante.getMesas()[0];
new EstadoConfirma().confirmar(mesaParaConfirmacao, reservaConfirmada);
restaurante.getReservas().add(reservaConfirmada);

Reserva reservaConfirmada2 = new Reserva(
    cliente2,
    restaurante,
    new QuantidadePessoas(4),
    LocalMesa.JARDIM,
    PeriodoReserva.NOITE,
    new EstadoPendente()
);
new EstadoConfirma().confirmar(restaurante.getMesas()[1], reservaConfirmada2);
restaurante.getReservas().add(reservaConfirmada2);

RelatorioReservasService relatorio = new RelatorioReservasService();
Map<String, List<Reserva>> mapa = relatorio.relatorioRestaurante(restaurante);
