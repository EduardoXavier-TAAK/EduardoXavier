public abstract class Pessoa {
    private String nome;
    private Documento cpf;
    
    public Pessoa(String nome, Documento cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }
    
    public String getCPF(){ return this.cpf.getCPF(); }

    public String getNome(){ return this.nome; }
}