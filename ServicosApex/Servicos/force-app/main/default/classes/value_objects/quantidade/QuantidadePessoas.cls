public with sharing class QuantidadePessoas {
    private Integer quantidade;

    public QuantidadePessoas(Integer quantidade) {
        if(quantidade <= 0 ) { throw new  IllegalArgumentException('Quantidade não pode ser menor ou igual a zero!'); }

        this.quantidade = quantidade;
    }

    public Integer getQuantidade() { return this.quantidade; }
}