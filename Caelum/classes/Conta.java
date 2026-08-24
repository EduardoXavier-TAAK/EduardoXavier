package classes;

public class Conta {

    private final String titular;
    private final String cpf;
    private final String numeroDaConta;
    private Double saldo;

    public Conta(String titular, String cpf, String numero) {
        this.titular = titular;
        this.cpf = cpf;
        this.numeroDaConta = numero;
        this.saldo = 0.0;
    }

    public void depositar(Double valor) {

        if(valor <= 0){throw new IllegalArgumentException("Valor de depósito inválido");}
        
        this.saldo += valor;
    }

    public void saca(double valor){
        this.saldo -= valor;
        System.out.println("Valor sacado: " + valor + "\nSaldo disponível: " + this.saldo);
    }

    public String getTitular(){
        return this.titular;
    }

    public String getCpf(){
        return this.cpf;
    }

    public String getNumeroDaConta(){
        return this.numeroDaConta;
    }

    public Double getSaldo(){
        return this.saldo;
    }

    public void setSaldo(Double saldo){
        this.saldo = saldo;
    }

}
