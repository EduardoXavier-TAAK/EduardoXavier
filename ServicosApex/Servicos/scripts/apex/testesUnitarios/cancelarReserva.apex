System.debug('Teste cancelar Reserva sem mesas');
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

System.debug('Reserva não aceita lista de espera: ');
restaurante.confirmarReserva(clientes[0], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.TARDE, false);

System.debug('-------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString() + ' Capacidade mesa: ' + i.mesa.getCapacidade()+ ' - ' + i.status.toString());
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade().toString());
    
}

System.debug('Teste cancelar com reserva na lista de espera: ');

restaurante.cancelaReserva(restaurante.getListaEspera()[0]);

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.status);
    
}

System.debug('--------------- Teste cancelar Reserva com mesas ---------------');

for(Integer i = 1; i <= 2; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 3), new QuantidadePessoas(2), LocalMesa.SALAO);
    
    mesas.add(mesa);
    mesas.add(mesa2);
}

restaurante = new Restaurante('Padaria', 'Viela do batman', mesas);

for(Mesa i : restaurante.getMesas()){
    System.debug(i.getIdentificador().toString() + ' - ' + i.getLocal().toString() + ' - ' + i.getCapacidade().toString());
}

for(Integer i = 1; i < 6; i++){
    restaurante.confirmarReserva(clientes[i], new QuantidadePessoas(i), LocalMesa.SALAO, PeriodoReserva.MANHA, true);
}

restaurante.confirmarReserva(clientes[5], new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA, true);

System.debug('Teste cancelar com reserva na lista de reservas: ');

System.debug('--------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade() + ' Capacidade mesa: ' + i.mesa.getCapacidade()+ ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade());
    
}

System.debug('------------ Cancelando reserva na lista de reservas');
System.debug('------------ Esperado que id: 6 com 1 pessoa seja promovido para lista de espera');

restaurante.cancelaReserva(restaurante.getReservas()[3]);

System.debug('--------------- Reservas: --------------' );
for(Restaurante.Reserva i : restaurante.getReservas()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade() + ' Capacidade mesa: ' + i.mesa.getCapacidade()+ ' - ' + i.status);
    
}

System.debug('-------------- Lista de espera: --------------' );

for(Restaurante.Reserva i : restaurante.getListaEspera()){
    System.debug(i.getCliente().getNome() + ' Quantidade de pessoas: ' +
                                i.getQuantidade());
    
}

System.debug('Cancelando reserva já cancelada');

restaurante.cancelaReserva(restaurante.getReservas()[3]);

