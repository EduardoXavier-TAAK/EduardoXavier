/*

Crie uma lista de contas contendo:

duas ContaCorrente
uma ContaPoupanca

Percorra a lista e calcule o total de taxas.

*/

List<Conta> lsContas = new List<Conta>();

Conta cr1 = new ContaCorrente(56,'Eu sou o Eduardo');
Conta cr2 = new ContaCorrente(56,'Eu sou o joao');
Conta cr3 = new ContaPoupanca(56,'Eu sou o Paulo');

cr1.depositar(7000);
cr2.depositar(2000);
cr3.depositar(7000);

lsContas.add(cr1);
lsContas.add(cr2);   
lsContas.add(cr3);   

CalculadoraDeTaxas calc = new CalculadoraDeTaxas(lsContas);

System.debug('Total de taxas cobradas: ' + calc.getTotalTaxas());
System.debug('Total de taxas cobradas na história: ' + CalculadoraDeTaxas.historicoTotalTaxas);


// Calculo de Impostos + taxas ContaCorrente

List<Tributavel> lsContasTributaveis = new List<Tributavel>();

ContaCorrente ct1 = new ContaCorrente(56,'Eu sou o joao');
ContaCorrente ct2 = new ContaCorrente(56,'Eu sou o Paulo');

ct1.depositar(7000);
ct2.depositar(2000);

lsContasTributaveis.add(ct1);
lsContasTributaveis.add(ct2);

CalculadoraDeImpostos calcImp = new CalculadoraDeImpostos(lsContasTributaveis);
System.debug('Total de impostos cobrados: ' + calcImp.getTotal());



