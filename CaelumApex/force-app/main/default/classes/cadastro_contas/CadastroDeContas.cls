public with sharing class CadastroDeContas {
    private List<Conta> contas = new List<Conta>();

    public CadastroDeContas() {}

    public void adicionarConta(Conta conta){ this.contas.add(conta); }

    public void listeTodasAsContas(){
        for(Conta i: this.contas){ System.debug(i.getNomeTitular()+ ' - ' + i.getNumeroConta()); }
    }

    public List<Conta> getAllContas(){ return this.contas; }
    
}

