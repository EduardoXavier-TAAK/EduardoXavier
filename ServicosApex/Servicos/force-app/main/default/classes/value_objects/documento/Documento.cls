public class Documento {
    private String cpf; 

    public Documento(String cpf) {
        if(String.isEmpty(cpf)){ throw new  IllegalArgumentException('CPF não pode ser nulo!'); }

        String cpfNumerico = cpf.replaceAll('[^0-9]', '');

        if(cpfNumerico.length() != 11){ 
            throw new IllegalArgumentException('CPF deve ter 11 digitos! (Apenas números)');
        }

        this.cpf = formatCPF(cpfNumerico);
    }

    private static String formatCPF(String cpf){
        return cpf.replaceAll('(\\d{3})(\\d{3})(\\d{3})(\\d{2})', '$1.$2.$3-$4');
    }

    public String getCPF(){ return this.cpf; }
}