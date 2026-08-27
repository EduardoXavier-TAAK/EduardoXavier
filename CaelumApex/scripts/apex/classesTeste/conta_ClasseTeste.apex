ContaCorrente conta = new ContaCorrente(2, 'Piolho');

conta.depositar(6000);
//conta.depositar(-20);

conta.sacar(2000);
//conta.sacar(100000000);
//conta.sacar(-10);

conta.setNomeTitular('Pio');
conta.setNumeroConta(5);

conta.calcularImposto();

conta.calcularTaxa();


System.debug('Nome: ' + conta.getNomeTitular());
System.debug('Numero: ' + conta.getNumeroConta());
System.debug('Saldo: ' + conta.getSaldo());

ContaPoupanca conta = new ContaPoupanca(2, 'olho');

conta.depositar(6000);
//conta.depositar(-20);

conta.sacar(2000);
//conta.sacar(100000000);
//conta.sacar(-10);

conta.setNomeTitular('Pio');
conta.setNumeroConta(5);

conta.calcularImposto();

conta.calcularTaxa();


System.debug('Nome: ' + conta.getNomeTitular());
System.debug('Numero: ' + conta.getNumeroConta());
System.debug('Saldo: ' + conta.getSaldo());


