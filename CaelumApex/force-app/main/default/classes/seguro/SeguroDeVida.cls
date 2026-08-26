public with sharing class SeguroDeVida implements Tributavel{
    private final static Decimal IMPOSTO = 0.42;
    private Decimal indenizacao;

    public SeguroDeVida(Decimal indenizacao) {
        this.indenizacao = indenizacao;
    }

    public Decimal calcularImposto(){ return (this.indenizacao * IMPOSTO).setScale(2); }
}