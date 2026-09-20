Restaurante restaurante = new Restaurante('Pizzaria do Eduardo', 'Rua Theodoro', new List<Mesa>());
RelatorioReservasService relatorio = new RelatorioReservasService();

for(Integer i = 1; i <= 2; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 3), new QuantidadePessoas(2), LocalMesa.JARDIM);

    restaurante.adicionarMesa(mesa);
    restaurante.adicionarMesa(mesa2);
}

List<Cliente> clientes = new List<Cliente>();

for(Integer i = 0; i <= 6; i++){
    Cliente cliente = new Cliente('Eduardo', new Documento('5384492783' + i.toString()));

    clientes.add(cliente);
}

System.debug('--- ) Fluxos do restauranteReservas ---');

// Confirmar Reserva

try {
    for(Integer i = 1; i <= 6; i++){
        
        restaurante.confirmarReserva(
                    clientes[i], new QuantidadePessoas(i + 1), LocalMesa.SALAO, PeriodoReserva.MANHA, true
        );

        System.debug('criarReserva executou sem erro. ' + i.toString() + clientes[i].getCPF());
    }

} catch (Exception e) {
    System.debug('criarReserva -> ' + e.getTypeName() + ': ' + e.getMessage() + ' ' + e.getStackTraceString() + e.getCause() + e.getLineNumber() );
}

// Cancelar Reserva

Reserva reservaConfirmada = restaurante.getReservas()[0];

System.debug(restaurante.getListaEspera().size());

try {
    restaurante.cancelaReserva(reservaConfirmada);
    System.debug('cancelarReserva executou sem erro: ' + restaurante.getReservas()[0].getCliente().getCPF() + ' - ' + restaurante.getReservas()[0].status);
   
    System.debug(restaurante.getReservas().size());
    System.debug(restaurante.getListaEspera().size());

    relatorio.relatorioRestaurante(restaurante.getReservas());

} catch (Exception e) {
    System.debug('cancelarReserva -> ' + e.getTypeName() + ': ' + e.getLineNumber() + e.getCause() + e.getMessage());
}
