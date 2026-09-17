List<Mesa> mesas = new List<Mesa>();
List<Reserva> reservas = new List<Reserva>();

mesas.add(new Mesa(new IdentificadorMesa(2), new QuantidadePessoas(4), LocalMesa.JARDIM));
mesas.add(new Mesa(new IdentificadorMesa(4), new QuantidadePessoas(2), LocalMesa.JARDIM));
mesas.add(new Mesa(new IdentificadorMesa(1), new QuantidadePessoas(1), LocalMesa.JARDIM));



Cliente cliente1 = new Cliente('Edu', new Documento('45687654219'));
Cliente cliente2 = new Cliente('Edu', new Documento('45687654216'));

//reservas.add(new Reserva(cliente1, rest, mesas[0], new QuantidadePessoas(4), LocalMesa.JARDIM, PeriodoReserva.MANHA, StatusReserva.CONFIRMADA));
//reservas.add(new Reserva(cliente2, rest, mesas[1], new QuantidadePessoas(2), LocalMesa.JARDIM, PeriodoReserva.MANHA, StatusReserva.CONFIRMADA));

Restaurante rest = new Restaurante('Luigi', 'Restaurante', mesas);

rest.criarReserva(cliente1, rest, new QuantidadePessoas(4), LocalMesa.JARDIM, PeriodoReserva.MANHA, true);
rest.criarReserva(cliente1, rest, new QuantidadePessoas(1), LocalMesa.JARDIM, PeriodoReserva.MANHA, true);



rest.criarReserva(cliente1, rest, new QuantidadePessoas(4), LocalMesa.JARDIM, PeriodoReserva.MANHA, true);

System.debug(rest.getListaEspera().size());

rest.cancelarReserva(rest.getReservas()[0]);

System.debug(rest.getListaEspera().size());

System.debug(rest.getReservas()[0]);

