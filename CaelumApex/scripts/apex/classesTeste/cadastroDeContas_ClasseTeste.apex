CadastroDeContas cadConta = new CadastroDeContas();

ContaCorrente conta = new ContaCorrente(5, 'Yuri Marcelo');

cadConta.adicionarConta(conta);

cadConta.listeTodasAsContas();

System.debug('Contas: ' + cadConta.getAllContas());