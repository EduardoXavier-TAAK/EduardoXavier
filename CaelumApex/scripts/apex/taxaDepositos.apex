//Teste taxas cobradas 

CadastroDeContas cadContas = new CadastroDeContas();
ContaCorrente cr = new ContaCorrente(45, 'Eduardo Oliveira');


cr.depositar(5000);

cadContas.adicionarConta(cr);

cr.taxasCobradas(cadContas.getAllContas());

// Teste deposito inválido 

CadastroDeContas cadContas2 = new CadastroDeContas();
ContaCorrente cr2 = new ContaCorrente(78, 'Eduardo Oliveira');

cr2.depositar(-20);

cadContas2.adicionarConta(cr2);

cr2.taxasCobradas(cadContas2.getAllContas());








