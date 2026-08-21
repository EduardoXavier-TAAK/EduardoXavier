package excecoes_e_controle_de_erros;
import classes.Conta;

public class CasosDeTesteErros {

    public static void main(String[] args) {
        Conta conta = new Conta("Eduardo", "538.449.278-32", "123.456.789.90");

        conta.depositar(100.0);
        conta.saca(1000.0);

        conta.depositar(0.00);
        
    }
}
