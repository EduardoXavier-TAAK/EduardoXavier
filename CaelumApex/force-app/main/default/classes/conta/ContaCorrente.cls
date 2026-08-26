public with sharing class ContaCorrente extends Conta implements Tributavel{

    public ContaCorrente(Integer numeroConta, String nomeTitular) {
        super(numeroConta, nomeTitular);
    }

    public override Decimal calcularTaxa(){
        Decimal taxa = (this.saldo * 0.01).setScale(2);
        this.saldo -= taxa;
        return taxa;
    }

    public Decimal calcularImposto(){
        Decimal imposto = (this.saldo * 0.02).setScale(2);
        this.saldo -= imposto;
        return imposto;
    }
}