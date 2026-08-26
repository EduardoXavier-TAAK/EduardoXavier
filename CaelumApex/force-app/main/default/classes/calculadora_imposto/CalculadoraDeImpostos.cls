public with sharing class CalculadoraDeImpostos {
    private List<Tributavel> lsTributos = new List<Tributavel>();
    private Decimal total = 0;

    public CalculadoraDeImpostos(List<Tributavel> lsTributos) {
        this.lsTributos = lsTributos;
        
        for(Tributavel i: lsTributos){ this.total += i.calcularImposto(); }
    }

    public Decimal getTotal(){ return this.total; }

    public List<Tributavel> getAllTributaveis(){ return this.lsTributos; }
}