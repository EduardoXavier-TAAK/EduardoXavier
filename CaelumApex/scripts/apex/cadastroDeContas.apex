List<Conta> contas =  new List<Conta>();
CadastroDeContas cadContas = new CadastroDeContas();

contas.add(new ContaCorrente(1, 'Eduardo Oliveira'));
contas.add(new ContaPoupanca(2, 'Eduardo Yuri'));
contas.add(new ContaCorrente(3, 'Yuri Oliveira'));
contas.add(new ContaCorrente(4, 'Yuri Alberto'));
contas.add(new ContaPoupanca(5, 'Fagner'));

System.debug(Conta.totalDeContas);


for(Conta i: contas){

    Decimal saldoAleatorio = (Math.random() * (5000 - 1)) + 1;
    i.depositar(saldoAleatorio);

    System.debug(i.getNomeTitular() + ' - ' + 'Saldo depositado: ' + saldoAleatorio);

    cadContas.adicionarConta(i);
    
}


cadContas.listeTodasAsContas();