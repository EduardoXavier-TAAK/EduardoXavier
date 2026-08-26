/*
    Crie um Set<Integer> para armazenar números de contas
   e garanta que não existam números repetidos.

*/
List<Conta> contas = new List<Conta>();
Set<String> codigos = new Set<String>();

CadastroDeContas cadConta = new CadastroDeContas();

Integer temp = 0;

for(Integer i = 0; i < 5; i++){

    temp = (Math.random() * (9999 - 1) + 1).intValue();

    if(codigos.add(temp)){ contas.add(new ContaCorrente(temp, 'NPC')); }

    else { throw new IllegalArgumentException('Valor repetido!'); }

}


for(Conta i: contas){
    cadConta.adicionarConta(i);
}

cadConta.listeTodasAsContas();