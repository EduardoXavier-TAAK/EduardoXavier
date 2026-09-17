System.debug('--- 2) Política de mesa duplicada ---');

MesaDuplicada regraDuplicidade = new MesaDuplicada();
List<Mesa> mesasDuplicadas = new List<Mesa>();
mesasDuplicadas.add(new Mesa(new IdentificadorMesa(1), new QuantidadePessoas(2), LocalMesa.SALAO));
mesasDuplicadas.add(new Mesa(new IdentificadorMesa(1), new QuantidadePessoas(4), LocalMesa.JARDIM));

try {
    regraDuplicidade.mesasDuplicadas(mesasDuplicadas);
    System.debug('Duplicidade não foi detectada!');
} catch (Exception e) {
    System.debug('Duplicidade detectada -> ' + e.getTypeName() + ': ' + e.getMessage());
}
