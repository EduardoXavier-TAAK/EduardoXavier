public abstract class Pessoa {
    public String nome {get; set; }
    private Documento cpf;

    public Pessoa(String nome, Documento cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }

    public Documento getCPF(){ return this.cpf; }
}