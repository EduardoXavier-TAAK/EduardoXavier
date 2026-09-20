public with sharing class Mesa {
    private QuantidadePessoas capacidade;
    private IdentificadorMesa numero;
    private LocalMesa local; 
    
    public Mesa(IdentificadorMesa numero, QuantidadePessoas capacidade, LocalMesa local) {
        this.numero = numero;
        this.capacidade = capacidade;
        this.local = local;
    }
    
    public Integer getCapacidade(){ return this.capacidade.getQuantidade(); }
    
    public Integer getIdentificador(){ return this.numero.getIdentificador(); }

    public LocalMesa getLocal(){ return this.local; }
    
}