System.debug('Teste promover Reserva ao adicionar uma mesa');
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

restaurante.confirmarReserva(clientes[0], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.TARDE, true);

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade().toString() + ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' - ' + i.status);
    
}

System.debug('--- Mesa adicionada ---');
restaurante.adicionarMesa(new Mesa(new IdentificadorMesa(1), new QuantidadePessoas(4), LocalMesa.SALAO));

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade().toString() + ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' - ' + i.status);

}


System.debug('------------Teste promover Reserva cancelada------------');

System.debug('--- Adicionando reserva na lista de esperas ---');

restaurante.confirmarReserva(clientes[0], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.TARDE, true);


System.debug('--- Cancelando reserva na lista de esperas ---');
restaurante.cancelaReserva(restaurante.getListaEspera()[0]);

System.debug('--- Adicionando mesa compativel ---');
restaurante.adicionarMesa(new Mesa(new IdentificadorMesa(2), new QuantidadePessoas(4), LocalMesa.SALAO));

System.debug('--- Teste promover reserva ao cancelar uma reserva com lista de esperas compativel: ');

restaurante.adicionarMesa(new Mesa(new IdentificadorMesa(4), new QuantidadePessoas(4), LocalMesa.SALAO));


for(Integer i = 1; i < 6; i++){
    restaurante.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.MANHA, true);
}

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade().toString() + ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' - ' + i.status);

}

System.debug('--- Cancelando Reserva ---');
restaurante.cancelaReserva(restaurante.getReservas()[1]);

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade().toString() + ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' - ' + i.status);

}

