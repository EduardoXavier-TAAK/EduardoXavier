CadastroDeContas cadContas = new CadastroDeContas();
ContaCorrente cr = new ContaCorrente(456, 'Eduardo Oliveira');


cr.depositar(5000);

cadContas.adicionarConta(cr);

try {
    cr.sacar(6000);
} catch (SaldoInsuficienteException e) {
    System.debug(LoggingLevel.ERROR, e.getMessage());
}