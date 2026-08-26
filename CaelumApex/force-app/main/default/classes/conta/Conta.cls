public with sharing abstract class Conta {
    public static Integer totalDeContas = 0;

    private Integer numeroConta;
    private String nomeTitular;
    protected Decimal saldo;

    public Conta(Integer numeroConta, String nomeTitular) {
        this.numeroConta = numeroConta;
        this.nomeTitular = nomeTitular;
        this.saldo = 0;
        totalDeContas++;
    }

    public abstract Decimal calcularTaxa();

    public void depositar(Decimal valor){
        ValidadorFinanceiro.validaDeposito(valor);

        (this.saldo += valor).setScale(2);
    }

    public void sacar(Decimal valor){
        ValidadorFinanceiro.validaSaque(valor, this.saldo);

        this.saldo -= valor.setScale(2);
    }

    public Integer getNumeroConta(){ return this.numeroConta; }

    public String getNomeTitular(){ return this.nomeTitular; }

    public Decimal getSaldo(){ return this.saldo; }

    public void setNomeTitular(String nomeTitular){ this.nomeTitular = nomeTitular; }

    public void setNumeroConta(Integer numeroConta){ this.numeroConta = numeroConta; }

}