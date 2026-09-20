Map<String, Object> payloadRestaurante = new Map<String, Object>{
    'nome' => 'Pizzaria do Bairro',
    'endereco' => 'Rua das Flores, 120',
    'reservas' => new List<Object>(),
    'listaEspera' => new List<Object>(),
    'mesas' => new List<Object>{
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 1 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 2 },
            'local' => 'SALAO'
        },
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 2 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 4 },
            'local' => 'JARDIM'
        },
        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 3 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 6 },
            'local' => 'SALAO'
        },

        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 4 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 6 },
            'local' => 'SALAO'
        },

        new Map<String, Object>{
            'numero' => new Map<String, Object>{ 'identificador' => 5 },
            'capacidade' => new Map<String, Object>{ 'quantidade' => 6 },
            'local' => 'SALAO'
        }
    }
};


Restaurante restaurante = (Restaurante) JSON.deserialize(JSON.serialize(payloadRestaurante), Restaurante.class);
System.debug('Restaurante montado: ' + restaurante.getNome() + ' - Mesas: ' + restaurante.getMesas().size());

GerenciadorReservas gerenciador = new GerenciadorReservas();

Cliente cliente1 = new Cliente('Ana Silva', new Documento('53844927832'));
Cliente cliente2 = new Cliente('Bruno Costa', new Documento('98765432100'));

try {
    for(Integer i = 0; i <= 5; i++){
        
    }
    Mesa mesaDisponivel = gerenciador.buscarDisponibilidade(
        restaurante.getMesas(),
        new QuantidadePessoas(2),
        LocalMesa.SALAO,
        PeriodoReserva.MANHA,
        restaurante
    );
    
    System.debug('Mesa encontrada pela política -> identificador: ' + mesaDisponivel.getIdentificador() + ' - local: ' + mesaDisponivel.local);
} catch (Exception e) {
    System.debug('Busca de mesa -> ' + e.getTypeName() + ': ' + e.getMessage());
}

try {
    Mesa mesaSemDisponibilidade = gerenciador.buscarDisponibilidade(
        restaurante.getMesas(),
        new QuantidadePessoas(99),
        LocalMesa.SALAO,
        PeriodoReserva.MANHA,
        restaurante
    );
    System.debug('Mesa para capacidade 99 -> ' + mesaSemDisponibilidade);
} catch (Exception e) {
    System.debug('Sem mesas disponíveis -> ' + e.getTypeName() + ': ' + e.getMessage());
}

PoliticaPrioridadeSalao prioridade = new PoliticaPrioridadeSalao(restaurante);

List<Mesa> mesasPriorizadas = prioridade.selecionarMesa(restaurante.getMesas(), new QuantidadePessoas(2), LocalMesa.SALAO, PeriodoReserva.MANHA);
System.debug('Mesas priorizadas para o salão -> ' + mesasPriorizadas.size());

for (Mesa mesa : mesasPriorizadas) {
    System.debug('  -> mesa ' + mesa.getIdentificador() + ' / capacidade ' + mesa.getCapacidade() + ' / local ' + mesa.getMesa());
}
