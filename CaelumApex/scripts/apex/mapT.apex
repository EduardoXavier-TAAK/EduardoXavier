Map<Integer, Conta> map = new Map<Integer, Conta>();

ContaCorrente cr1 = new ContaCorrente(45, 'Matheus');
ContaCorrente cr2 = new ContaCorrente(54, 'Vitor');
ContaCorrente cr3 = new ContaCorrente(67, 'Julio');

map.put(cr1.getNumeroConta(), cr1);
map.put(cr2.getNumeroConta(), cr2);
map.put(cr3.getNumeroConta(), cr3);


System.debug('Conta encontrada: ' + map.get(45).getNomeTitular());