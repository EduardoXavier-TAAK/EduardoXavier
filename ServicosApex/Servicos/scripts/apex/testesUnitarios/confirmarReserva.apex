System.debug('Teste Confirmar Reserva sem mesas');
List<Mesa> mesas = new List<Mesa>();

Restaurante restaurante = new Restaurante('Pizzaria', 'Rua Rio de Janeiro', mesas);

for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' - ' + i.getRestaurante().getNome());
}

List<Cliente> clientes = new List<Cliente>();


for(Integer i = 1; i <= 6; i++){
    Cliente cliente = new Cliente('Eduardo Oliveira Id:' + i.toString(), new Documento('5384492783' + i.toString()));
    clientes.add(cliente);
}

System.debug('-----------Reserva primeira, aceita lista de espera: ');
restaurante.confirmarReserva(clientes[0], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.TARDE, true);

System.debug('-----------Reserva não aceita lista de espera: ');
restaurante.confirmarReserva(clientes[0], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.TARDE, false);

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade().toString());
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString());
    
}


System.debug('--------------- Teste Confirmar Reserva com mesas ---------------');

for(Integer i = 1; i <= 2; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 3), new QuantidadePessoas(2), LocalMesa.SALAO);
    
    mesas.add(mesa);
    mesas.add(mesa2);
}

restaurante = new Restaurante('Padaria', 'Beco do batman', mesas);

for(Mesa i : restaurante.getMesas()){
    System.debug(i.getIdentificador().toString() + ' - ' + i.getLocal().toString() + ' - ' + i.getCapacidade().toString());
}

for(Integer i = 1; i < 6; i++){
    restaurante.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.MANHA, true);
}

restaurante.confirmarReserva(clientes[5], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA, false);

System.debug('--------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade() + ' Capacidade mesa: ' + i.mesa.getCapacidade());
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade());
    
}


System.debug('--------------- Teste Confirmar Reserva com mesas já alocadas mas em periodos diferentes');

restaurante.confirmarReserva(clientes[3], new QuantidadePessoas(2), LocalMesa.SALAO, PeriodoReserva.TARDE, false);
restaurante.confirmarReserva(clientes[2], new QuantidadePessoas(4), LocalMesa.SALAO, PeriodoReserva.TARDE, false);
restaurante.confirmarReserva(clientes[1], new QuantidadePessoas(4), LocalMesa.SALAO, PeriodoReserva.TARDE, false);


System.debug('--------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade() + ' Capacidade mesa: ' + i.mesa.getCapacidade());
}

System.debug('--------------- Teste Confirmar Reserva já confirmada');

new EstadoConfirma().confirmar(restaurante.getReservas()[0]);

System.debug('--------------- Teste Confirmar Reserva cancelada');

restaurante.cancelaReserva(restaurante.getReservas()[0]);

new EstadoConfirma().confirmar(restaurante.getReservas()[0]);