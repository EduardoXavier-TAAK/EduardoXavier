public with sharing class Mesa {
    private QuantidadePessoas capacidade;
    public IdentificadorMesa numero { get; set; }
    public LocalMesa local { get; set; }

    public Mesa(IdentificadorMesa numero, QuantidadePessoas capacidade, LocalMesa local) {
        this.numero = numero;
        this.capacidade = capacidade;
        this.local = local;
    }

    public Integer getCapacidade(){ return this.capacidade.getQuantidade(); }

}