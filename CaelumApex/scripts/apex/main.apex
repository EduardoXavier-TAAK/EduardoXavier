// Bulking mindset com alguns extras do restante do sistema

// Criação de usuários
CadastroDeContas contas = new CadastroDeContas();

Map<Integer, Conta> map = new Map<Integer, Conta>();
Set<Integer> codigos = new Set<Integer>();

String [] nomes = new String[]{'Eduardo', 'Igor', 'Matheus', 'Tayson', 'Maria'};

    for(Integer i = 0; i < nomes.size(); i++){
        Integer codigo = (Math.random() * (30 - 1) + 1).intValue();

    if(codigos.add(codigo)){ 
        ContaCorrente newUser = new ContaCorrente(codigo, nomes[i]);

        newUser.depositar(5000);
        map.put(codigo, newUser);
        
        contas.adicionarConta(newUser);

    } else {
        System.debug(LoggingLevel.WARN, 'Valor repetido: ' + codigo);
        indice--;
    }


}

// Encontrar usuários

Set<Integer> codigosEnviados = new Set<Integer>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
List<Conta> contasEncontradas = new List<Conta>();

for(Integer i: codigosEnviados){
    Conta contaEncontrada = map.get(i);

    if(contaEncontrada != null){
        System.debug('Conta Encontrada: ' + i + ' - ' + contaEncontrada.getNomeTitular());
        contasEncontradas.add(contaEncontrada);
    } else {
        System.debug('Conta não encontrada!');
    }
}