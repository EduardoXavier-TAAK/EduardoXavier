public with sharing class ContaPoupanca extends Conta{

    public ContaPoupanca(Integer numeroConta, String nomeTitular) {
        super(numeroConta, nomeTitular);
        
    }

    public override Decimal calcularTaxa(){
        Decimal taxa = (this.saldo * 0.005).setScale(2);
        this.saldo -= taxa;
        return taxa;
    }
}
