System.debug('Teste Confirmar Reserva sem mesas');
List<Mesa> mesas = new List<Mesa>();
List<Restaurante> restaurantes = new List<Restaurante>();

Restaurante restaurante = new Restaurante('Pizzaria', 'Rua Rio de Janeiro', mesas);

for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' - ' + i.getRestaurante().getNome());
}

List<Cliente> clientes = new List<Cliente>();


for(Integer i = 1; i <= 6; i++){
    Cliente cliente = new Cliente('Eduardo Oliveira Id:' + i.toString(), new Documento('5384492783' + i.toString()));
    clientes.add(cliente);
}

for(Integer i = 1; i <= 4; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 4), new QuantidadePessoas(2), LocalMesa.SALAO);
    
    mesas.add(mesa);
    mesas.add(mesa2);
}

for(Integer i = 1; i < 6; i++){
    restaurante.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.MANHA, true);
}

restaurantes.add(restaurante);


RelatorioReservasService relatorios = new RelatorioReservasService();

System.debug('------------ Reservas com o relatorio: --------------');
relatorios.relatorioRestaurante(restaurante.getReservas());


System.debug('-------------Cancelando uma reserva ----------');

restaurante.cancelaReserva(restaurante.getReservas()[0]);


Restaurante restaurante2 = new Restaurante('Padaria', 'Beco do batman', mesas);

for(Integer i = 1; i < 6; i++){
    restaurante2.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.MANHA, true);
    restaurante2.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.TARDE, true);
}


restaurantes.add(restaurante2);
System.debug('------------- Relatorios de todos os restaurantes ---------');
relatorios.relatoriosAll(restaurantes);
