public with sharing class ValidadorFinanceiro {

    public static void validaDeposito(Decimal valor){
        if(valor <= 0){ throw new IllegalArgumentException('Valor inválido!'); }
    }

    public static void validaSaque(Decimal valor, Decimal saldo){
        if(valor > saldo){ throw new SaldoInsuficienteException('Saldo insuficiente! '); }

        validaDeposito(valor);
    }

}