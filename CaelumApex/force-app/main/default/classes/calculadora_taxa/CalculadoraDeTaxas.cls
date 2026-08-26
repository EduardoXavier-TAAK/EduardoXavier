public with sharing class CalculadoraDeTaxas {
    public static Decimal historicoTotalTaxas = 0;
    
    private List<Conta> contas = new List<Conta>();
    private Decimal totalTaxas = 0;  

    public CalculadoraDeTaxas(List<Conta> contas) {
        this.contas = contas;

        for(Conta i: contas){ this.totalTaxas += i.calcularTaxa(); }

        historicoTotalTaxas += this.totalTaxas;
    }

    public Decimal getTotalTaxas(){ return this.totalTaxas; }

}