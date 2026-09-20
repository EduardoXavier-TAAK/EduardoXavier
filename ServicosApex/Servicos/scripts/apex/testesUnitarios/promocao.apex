System.debug('Teste promover Reserva sem mesas');
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

