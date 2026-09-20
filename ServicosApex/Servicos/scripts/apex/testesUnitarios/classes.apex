System.debug('Teste Restaurante');
Mesa mesaPrimeira = new Mesa(new IdentificadorMesa(9), new QuantidadePessoas(6), LocalMesa.SALAO);

Restaurante restaurante = new Restaurante('Pizzaria', 'Rua Rio de Janeiro', new List<Mesa>());

System.debug('----------- Teste Mesa -----------------');

restaurante.adicionarMesa(mesaPrimeira);

System.debug(mesaPrimeira.getIdentificador().toString() + 
            '.ID - ' + mesaPrimeira.getLocal().toString() + ' - ' + mesaPrimeira.getCapacidade().toString());

for(Integer i = 1; i <= 2; i++){
    Mesa mesa = new Mesa(new IdentificadorMesa(i), new QuantidadePessoas(4), LocalMesa.SALAO);
    Mesa mesa2 = new Mesa(new IdentificadorMesa(i + 3), new QuantidadePessoas(2), LocalMesa.JARDIM);

    restaurante.adicionarMesa(mesa);
    restaurante.adicionarMesa(mesa2);
}


for(Mesa i : restaurante.getMesas()){
    System.debug(i.getIdentificador().toString() + ' - ' + i.getLocal().toString() + ' - ' + i.getCapacidade().toString());
}

System.debug('----------- Teste Mesa duplicada -----------------');
try {
    restaurante.adicionarMesa(new Mesa(new IdentificadorMesa(9), new QuantidadePessoas(6), LocalMesa.SALAO));
    
} catch (IllegalArgumentException e){ System.debug(e.getMessage()); }



System.debug('----------- Teste Restaurante -----------------');

System.debug(restaurante.getNome() + ' - ' + restaurante.getEndereco() + ' - Mesas:');




System.debug('----------- Teste Clientes -----------------');

Cliente cliente = new Cliente('Eduardo Oliveira', new Documento('53844927832'));

System.debug(cliente.getNome() + ' - ' + cliente.getCPF());


System.debug('----------CPFs invalidos-------------');

try {
    Cliente cliente2 = new Cliente('Eduardo Oliveira', new Documento('5384492783'));
    
} catch (IllegalArgumentException e){ System.debug(e.getMessage()); }

try {
    Cliente cliente2 = new Cliente('Eduardo Oliveira', new Documento(''));
    
} catch (IllegalArgumentException e){ System.debug(e.getMessage()); }

try {
    Cliente cliente2 = new Cliente('Eduardo Oliveira', new Documento('Eduardo Oliveira'));

} catch (IllegalArgumentException e){ System.debug(e.getMessage()); }


System.debug('---------- Teste Reserva --------------');

Restaurante.Reserva reserva = new Restaurante.Reserva(cliente, 
                    restaurante, 
                    new QuantidadePessoas(4), 
                    mesaPrimeira, 
                    LocalMesa.JARDIM,
                    PeriodoReserva.MANHA,
                    new EstadoPendente());

System.debug(reserva.getCliente().getCPF() + ' - ' + reserva.getDataDeRegistro().toString() + ' - ' + reserva.getLocal().toString());







