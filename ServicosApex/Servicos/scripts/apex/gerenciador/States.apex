
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

System.debug('--- 5) Verificações de estado ---');

Reserva reservaCancelada = new Reserva(
    cliente1,
    restaurante,
    new QuantidadePessoas(2),
    LocalMesa.SALAO,
    PeriodoReserva.TARDE,
    new EstadoPendente()
);
new EstadoCancela(reservaCancelada);

try {
    new EstadoPendente().verificar(reservaCancelada);
    System.debug('Estado cancelado foi aceito indevidamente.');
} catch (Exception e) {
    System.debug('Reserva cancelada -> ' + e.getTypeName() + ': ' + e.getMessage());
}

Reserva reservaJaConfirmada = new Reserva(
    cliente1,
    restaurante,
    new QuantidadePessoas(2),
    LocalMesa.SALAO,
    PeriodoReserva.MANHA,
    new EstadoConfirma()
);

try {
    new EstadoPendente().verificar(reservaJaConfirmada);
    System.debug('Reserva confirmada foi aceita indevidamente.');
} catch (Exception e) {
    System.debug('Reserva já confirmada -> ' + e.getTypeName() + ': ' + e.getMessage());
}
