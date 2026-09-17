System.debug('--- 1) Value Objects ---');

try {
    Documento cpfNulo = new Documento(null);
    System.debug('CPF nulo aceito: ' + cpfNulo.getCPF());
} catch (Exception e) {
    System.debug('CPF nulo -> ' + e.getTypeName() + ': ' + e.getMessage());
}

try {
    Documento cpfInvalido = new Documento('123');
    System.debug('CPF inválido aceito: ' + cpfInvalido.getCPF());
} catch (Exception e) {
    System.debug('CPF inválido -> ' + e.getTypeName() + ': ' + e.getMessage());
}

Documento cpfValido = new Documento('12345678909');
System.debug('CPF válido -> ' + cpfValido.getCPF());

try {
    QuantidadePessoas qtdZero = new QuantidadePessoas(0);
    System.debug('Quantidade zero aceita: ' + qtdZero.getQuantidade());
} catch (Exception e) {
    System.debug('Quantidade zero -> ' + e.getTypeName() + ': ' + e.getMessage());
}

try {
    QuantidadePessoas qtdNegativa = new QuantidadePessoas(-2);
    System.debug('Quantidade negativa aceita: ' + qtdNegativa.getQuantidade());
} catch (Exception e) {
    System.debug('Quantidade negativa -> ' + e.getTypeName() + ': ' + e.getMessage());
}
