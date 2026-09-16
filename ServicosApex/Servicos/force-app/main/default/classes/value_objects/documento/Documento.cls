public class Documento {
    private String cpf; 

    public Documento(String cpf) {
        if(cpf == null){ throw new  IllegalArgumentException('CPF não pode ser nulo!'); } else 

        if(cpf.length() != 11){ 
            throw new IllegalArgumentException('CPF deve ter 11 digitos! (Apenas números)');
        }

        this.cpf = formatCPF(cpf);
    }

    private static String formatCPF(String cpf){
        cpf.replaceAll('[^0-9]', '');

        return cpf.replaceAll('(\\d{3})(\\d{3})(\\d{3})(\\d{2})', '$1.$2.$3-$4');
    }

    public String getCPF(){ return this.cpf; }
}