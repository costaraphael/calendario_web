EventoTipo.create([
                      {nome: 'G1', tem_dia_semana: false, tem_periodo: false, tem_descricao: false},
                      {nome: 'G2', tem_dia_semana: false, tem_periodo: false, tem_descricao: false},
                      {nome: 'Substituição', tem_dia_semana: false, tem_periodo: false, tem_descricao: false},
                      {nome: 'Semi-Presencial', tem_dia_semana: false, tem_periodo: false, tem_descricao: false},
                      {nome: 'Feriado', tem_dia_semana: false, tem_periodo: true, tem_descricao: true},
                      {nome: 'Institucional', tem_dia_semana: false, tem_periodo: true, tem_descricao: true},
                      {nome: 'Aula trocada', tem_dia_semana: true, tem_periodo: false, tem_descricao: false}
                  ])

Usuario.create([{
                   nome: 'Administrador',
                   login: 'admin',
                   senha: 'da34c0375388e95326255177173cf16e50b8125f',
                   salt: '134a89b460c66fb2f0645bed58c71cc5e169fc1b',
                   ativo: true
                }])