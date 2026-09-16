public with sharing class Restaurante {
    private String nome;
    private String endereco;
    private List<Reserva> reservas;
    private List<Reserva> listaEspera;
    private List<Mesa> mesas;
    private MesaDuplicada duplicadas;


    public Restaurante(String nome, String endereco, List<Mesa> mesas) {
        this.nome = nome;
        this.endereco = endereco;
        duplicadas.mesasDuplicadas(mesas);
        this.mesas = mesas;
        this.reservas = new List<Reserva>();
        this.listaEspera = new List<Reserva>();
    }


    public void adicionarMesa(Mesa mesa) {

        duplicadas.mesaDuplicada(this.mesas, mesa);

        this.mesas.add(mesa);

        System.debug('Mesa cadastrada com sucesso!');
    }


    //public static Map<String, List<Reserva>> gerarRelatorio(List<Documento> cpf, List<Restaurante> restaurantes){
      //  Map<String, List<Reserva>> reservas = new Map<String, List<Reserva>>();
    //}
    
    public String getNome(){ return this.nome; }

    public String getEndereco(){ return this.endereco; }

    public List<Reserva> getReservas(){ return this.reservas; }

    public List<Reserva> getListaEspera(){ return this.listaEspera; }

    public List<Mesa> getMesas(){ return this.mesas; }
    
}