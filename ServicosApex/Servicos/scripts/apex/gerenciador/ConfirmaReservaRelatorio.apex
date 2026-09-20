List<Mesa> mesas = new List<Mesa>();

mesas.add(new Mesa(new IdentificadorMesa(1), new QuantidadePessoas(2), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(2), new QuantidadePessoas(6), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(3), new QuantidadePessoas(4), LocalMesa.JARDIM));
mesas.add(new Mesa(new IdentificadorMesa(4), new QuantidadePessoas(2), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(5), new QuantidadePessoas(2), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(6), new QuantidadePessoas(2), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(7), new QuantidadePessoas(6), LocalMesa.JARDIM));
mesas.add(new Mesa(new IdentificadorMesa(8), new QuantidadePessoas(2), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(9), new QuantidadePessoas(5), LocalMesa.SALAO));
mesas.add(new Mesa(new IdentificadorMesa(10), new QuantidadePessoas(1), LocalMesa.SALAO));

Restaurante restaurante = new Restaurante('Pizzaria do Bairro', 'Rua do bombom', mesas);


System.debug('Restaurante montado: ' + restaurante.getNome() + ' -  Mesas: ' + restaurante.getMesas().size());

Cliente cliente1 = new Cliente('Ana Silva', new Documento('53844927832'));
Cliente cliente2 = new Cliente('Bruno Costa', new Documento('98765432100'));

Restaurante.Reserva reservaConfirmada = new Reserva(
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

Restaurante.Reserva reservaConfirmada2 = new Reserva(
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
