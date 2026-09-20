System.debug('Teste Restaurante');
Restaurante restaurante = new Restaurante('Pizzaria', 'Rua Rio de Janeiro', new List<Mesa>());

System.debug('----------Teste buscar com lista de mesas vazia-------------');

try {
    System.debug(restaurante.buscarMesa(new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA).getIdentificador());

} catch(Exception e){
    System.debug(e.getMessage());
}

Mesa mesaPrimeira = new Mesa(new IdentificadorMesa(9), new QuantidadePessoas(6), LocalMesa.SALAO);

restaurante.adicionarMesa(mesaPrimeira);

System.debug('----------Teste buscar com uma mesa-------------');

try {
    System.debug(restaurante.buscarMesa(new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA).getIdentificador());

} catch(Exception e){
    System.debug(e.getMessage());
}


for(Integer i = 1; i <= 2; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 3), new QuantidadePessoas(2), LocalMesa.SALAO);

    restaurante.adicionarMesa(mesa);
    restaurante.adicionarMesa(mesa2);
}


for(Mesa i : restaurante.getMesas()){
    System.debug(i.getIdentificador().toString() + ' - ' + i.getLocal().toString() + ' - ' + i.getCapacidade().toString());
}

System.debug('----------Teste buscar com lista de reservas vazia-------------');
try {
    System.debug(restaurante.buscarMesa(new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA).getIdentificador());

} catch(IllegalArgumentException e){
    System.debug(e.getMessage());
}

System.debug('----------Teste buscar com lista de reservas alimentada -------------');

Cliente cliente = new Cliente('Eduardo Oliveira', new Documento('53844927832'));

restaurante.confirmarReserva(cliente, new QuantidadePessoas(4), LocalMesa.SALAO, PeriodoReserva.MANHA, true);

restaurante.confirmarReserva(cliente, new QuantidadePessoas(1), LocalMesa.SALAO, PeriodoReserva.MANHA, true);

try {
    System.debug(restaurante.buscarMesa(new QuantidadePessoas(1), 
                            LocalMesa.SALAO, PeriodoReserva.MANHA).getIdentificador());

} catch(IllegalArgumentException e){
    System.debug(e.getMessage());
}