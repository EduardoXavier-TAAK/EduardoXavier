public with sharing class CadastroDeContas {
    private List<Conta> contas = new List<Conta>();

    public CadastroDeContas() {

    }

    public void adicionarConta(Conta conta){
        this.contas.add(conta);
    }

    this.adicionarConta(new Conta('456.987', 'Eduardo Oliveira'));

    public void listeTodasAsContas(){
        for(Conta i: this.contas){
            System.debug(i.getNomeTitular()+ '-' + i.getNumeroConta());
        }
    }
}

