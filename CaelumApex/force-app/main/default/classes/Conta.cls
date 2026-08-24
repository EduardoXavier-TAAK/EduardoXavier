public with sharing class Conta {
    private final String numeroConta;
    private String nomeTitular;
    private Decimal saldo;

    public Conta(String numeroConta, String nomeTitular) {
        this.numeroConta = numeroConta;
        this.nomeTitular = nomeTitular;
        this.saldo = 0;
    }

    public void depositar(Decimal valor){
        if(valor <= 0){
            throw new IllegalArgumentException('Valor inválido');
        }

        this.saldo += valor;
    }

    public String getNumeroConta(){
        return this.numeroConta;
    }

    public String getNomeTitular(){
        return this.nomeTitular;
    }

    public Double getSaldo(){
        return this.saldo;
    }

    public void setNomeTitular(String nomeTitular){
        this.nomeTitular = nomeTitular;
    }
 
}