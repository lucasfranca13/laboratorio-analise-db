-- INSERTS TABELA CONVENIO
INSERT INTO convenio (id_convenio, nome, codigo)
VALUES (1, 'Plano Ouro', 'P001');

INSERT INTO convenio (id_convenio, nome, codigo)
VALUES (2, 'Plano Prata', 'P002');

INSERT INTO convenio (id_convenio, nome, codigo)
VALUES (3, 'Plano Bronze', 'P003');

INSERT INTO convenio (id_convenio, nome, codigo)
VALUES (4, 'Plano Premium', 'P004');


-- INSERTS TABELA MEDICO
INSERT INTO medico (id_medico, nome, crm, especialidade)
VALUES (1, 'Dr. João Silva', '12345', 'Clínico Geral');

INSERT INTO medico (id_medico, nome, crm, especialidade)
VALUES (2, 'Dra. Maria Souza', '67890', 'Endocrinologista');

INSERT INTO medico (id_medico, nome, crm, especialidade)
VALUES (3, 'Dr. Carlos Pereira', '11223', 'Pediatra');

INSERT INTO medico (id_medico, nome, crm, especialidade)
VALUES (4, 'Dra. Ana Ribeiro', '33445', 'Radiologista');



-- INSERTS TABELA TECNICO
INSERT INTO tecnico (id_tecnico, nome)
VALUES (1, 'Téc. Marcos Almeida');

INSERT INTO tecnico (id_tecnico, nome)
VALUES (2, 'Téc. Julia Ferreira');

INSERT INTO tecnico (id_tecnico, nome)
VALUES (3, 'Téc. Pedro Ramos');

INSERT INTO tecnico (id_tecnico, nome)
VALUES (4, 'Téc. Sofia Lima');


-- INSERTS TABELA TIPO_EXAME
INSERT INTO tipo_exame (id_tipo_exame, nome, categoria, codigo_tuss, preparo, descricao)
VALUES (1, 'Hemograma', 'LAB', '1001', NULL, 'Exame de sangue completo');

INSERT INTO tipo_exame (id_tipo_exame, nome, categoria, codigo_tuss, preparo, descricao)
VALUES (2, 'Glicose', 'LAB', '1002', 'Jejum de 8 horas', 'Taxa de glicose no sangue');

INSERT INTO tipo_exame (id_tipo_exame, nome, categoria, codigo_tuss, preparo, descricao)
VALUES (3, 'Ultrassom Abdomen', 'IMAGEM', '2001', 'Beber 1L de água', 'Exame de imagem do abdômen');

INSERT INTO tipo_exame (id_tipo_exame, nome, categoria, codigo_tuss, preparo, descricao)
VALUES (4, 'Raio-X Tórax', 'IMAGEM', '2002', NULL, 'Radiografia do tórax');


-- INSERTS TABELA VALORES_REFERENCIA
INSERT INTO valores_referencia (id_valor_ref, id_tipo_exame, genero, idade_minima, idade_maxima, valor_min, valor_max)
VALUES (1, 1, 'M', 0, 150, 4.5, 11.0);

INSERT INTO valores_referencia (id_valor_ref, id_tipo_exame, genero, idade_minima, idade_maxima, valor_min, valor_max)
VALUES (2, 1, 'F', 0, 150, 4.0, 10.5);

INSERT INTO valores_referencia (id_valor_ref, id_tipo_exame, genero, idade_minima, idade_maxima, valor_min, valor_max)
VALUES (3, 2, 'M', 0, 150, 70, 99);

INSERT INTO valores_referencia (id_valor_ref, id_tipo_exame, genero, idade_minima, idade_maxima, valor_min, valor_max)
VALUES (4, 2, 'F', 0, 150, 65, 95);


-- INSERTS TABELA CLIENTE
INSERT INTO cliente (id_cliente, nome, genero, data_nascimento, cpf, rg, filiacao_pai, filiacao_mae, nacionalidade, naturalidade, endereco_completo, telefone, email, observacoes)
VALUES (1, 'José Geraldo', 'M', DATE '2000-05-10', '123.456.789-00', 'MG1234567',
        'João', 'Maria', 'Brasileiro', 'Belo Horizonte', 'Rua A, 100', '31999990000', 'paulo@email.com', NULL);

INSERT INTO cliente (id_cliente, nome, genero, data_nascimento, cpf, rg, filiacao_pai, filiacao_mae, nacionalidade, naturalidade, endereco_completo, telefone, email, observacoes)
VALUES (2, 'Carla Mendes', 'F', DATE '1995-08-20', '987.654.321-00', 'SP9988776',
        'Carlos Mendes', 'Adriana Mendes', 'Brasileira', 'São Paulo', 'Rua B, 200', '11988887777', NULL, NULL);

INSERT INTO cliente (id_cliente, nome, genero, data_nascimento, cpf, rg, filiacao_pai, filiacao_mae, nacionalidade, naturalidade, endereco_completo, telefone, email, observacoes)
VALUES (3, 'Pedro Souza', 'M', DATE '2010-02-14', '555.666.777-88', NULL,
        'Ricardo Souza', 'Fernanda Souza', 'Brasileiro', 'Contagem', 'Rua C, 300', NULL, NULL, NULL);

INSERT INTO cliente (id_cliente, nome, genero, data_nascimento, cpf, rg, filiacao_pai, filiacao_mae, nacionalidade, naturalidade, endereco_completo, telefone, email, observacoes)
VALUES (4, 'Ana Oliveira', 'F', DATE '1988-11-30', '222.333.444-55', 'MG1122334',
        'Paulo Oliveira', 'Marcia Oliveira', 'Brasileira', 'Sete Lagoas', 'Rua D, 400', '31970001122', 'ana@teste.com', 'Alergia a contraste');

-- INSERTS TABELA DADOS_SAUDE
INSERT INTO dados_saude (id_dado_saude, id_cliente, tipo, descricao)
VALUES (1, 1, 'ALERGIA', 'Alergia a pólen');

INSERT INTO dados_saude (id_dado_saude, id_cliente, tipo, descricao)
VALUES (2, 2, 'CONDICAO', 'Asma leve');

INSERT INTO dados_saude (id_dado_saude, id_cliente, tipo, descricao)
VALUES (3, 3, 'OBSERVACAO', 'Paciente pediátrico');

INSERT INTO dados_saude (id_dado_saude, id_cliente, tipo, descricao)
VALUES (4, 4, 'CONDICAO', 'Hipertensão controlada');


-- INSERTS TABELA ATENDIMENTO
INSERT INTO atendimento (id_atendimento, id_cliente, data_hora, tipo_atendimento, id_convenio, autorizacao_convenio, senha_atendimento)
VALUES (1, 1, TIMESTAMP '2024-09-10 08:30:00', 'ROTINA', 1, 'AUTH001', 'SENHA1');

INSERT INTO atendimento (id_atendimento, id_cliente, data_hora, tipo_atendimento, id_convenio, autorizacao_convenio, senha_atendimento)
VALUES (2, 2, TIMESTAMP '2024-09-11 09:20:00', 'URGENCIA', 2, 'AUTH002', 'SENHA2');

INSERT INTO atendimento (id_atendimento, id_cliente, data_hora, tipo_atendimento, id_convenio, autorizacao_convenio, senha_atendimento)
VALUES (3, 3, TIMESTAMP '2024-09-12 10:05:00', 'ROTINA', NULL, NULL, 'SENHA3');

INSERT INTO atendimento (id_atendimento, id_cliente, data_hora, tipo_atendimento, id_convenio, autorizacao_convenio, senha_atendimento)
VALUES (4, 4, TIMESTAMP '2024-09-15 14:30:00', 'ROTINA', 4, 'AUTH004', 'SENHA4');


-- INSERTS TABELA ACESSO_EXAME
INSERT INTO acesso_exame (id_acesso, id_atendimento, codigo_acesso, senha_acesso)
VALUES (1, 1, 'ACESSO123', '123456');

INSERT INTO acesso_exame (id_acesso, id_atendimento, codigo_acesso, senha_acesso)
VALUES (2, 2, 'ACESSO456', '654321');

INSERT INTO acesso_exame (id_acesso, id_atendimento, codigo_acesso, senha_acesso)
VALUES (3, 3, 'ACESSO789', '112233');

INSERT INTO acesso_exame (id_acesso, id_atendimento, codigo_acesso, senha_acesso)
VALUES (4, 4, 'ACESSO999', '445566');


-- INSERTS TABELA PEDIDO_EXAME
INSERT INTO pedido_exame (id_pedido, id_atendimento, id_medico_solicitante, cid, observacao_medico, data_solicitacao)
VALUES (1, 1, 1, 'R10', 'Pedido de exames de rotina', DATE '2024-09-10');

INSERT INTO pedido_exame (id_pedido, id_atendimento, id_medico_solicitante, cid, observacao_medico, data_solicitacao)
VALUES (2, 2, 2, 'E11', 'Paciente com histórico de glicemia elevada', DATE '2024-09-11');

INSERT INTO pedido_exame (id_pedido, id_atendimento, id_medico_solicitante, cid, observacao_medico, data_solicitacao)
VALUES (3, 3, 3, NULL, 'Check-up infantil', DATE '2024-09-12');

INSERT INTO pedido_exame (id_pedido, id_atendimento, id_medico_solicitante, cid, observacao_medico, data_solicitacao)
VALUES (4, 4, 4, NULL, 'Avaliação geral', DATE '2024-09-15');


-- INSERTS TABELA ITEM_PEDIDO
INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (1, 1, 1, NULL, 'REALIZADO'); -- Hemograma

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (2, 1, 2, 'Paciente em jejum', 'REALIZADO'); -- Glicose

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (3, 2, 3, NULL, 'AGENDADO'); -- Ultrassom

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (4, 3, 2, NULL, 'REALIZADO'); -- Glicose

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (5, 4, 1, NULL, 'REALIZADO'); -- Hemograma

INSERT INTO item_pedido (id_item_pedido, id_pedido, id_tipo_exame, observacao_preparo, status)
VALUES (6, 4, 4, NULL, 'REALIZADO'); -- Raio-X


-- INSERTS TABELA AGENDAMENTO
INSERT INTO agendamento (id_agendamento, id_item_pedido, data_hora, id_tecnico, sala_ou_box)
VALUES (1, 3, TIMESTAMP '2024-09-13 15:00:00', 2, 'Sala 02');


-- INSERTS TABELA PROCEDIMENTO
INSERT INTO procedimento (id_procedimento, id_item_pedido, id_tecnico, data_hora, observacao)
VALUES (1, 1, 1, TIMESTAMP '2024-09-10 09:00:00', 'Coleta realizada com sucesso.');

INSERT INTO procedimento (id_procedimento, id_item_pedido, id_tecnico, data_hora, observacao)
VALUES (2, 2, 1, TIMESTAMP '2024-09-10 09:10:00', 'Paciente em jejum.');

INSERT INTO procedimento (id_procedimento, id_item_pedido, id_tecnico, data_hora, observacao)
VALUES (3, 4, 3, TIMESTAMP '2024-09-12 10:30:00', 'Paciente tranquilo.');

INSERT INTO procedimento (id_procedimento, id_item_pedido, id_tecnico, data_hora, observacao)
VALUES (4, 5, 4, TIMESTAMP '2024-09-15 15:00:00', 'Coleta sem intercorrências.');


-- INSERTS TABELA RESULTADO_EXAME
INSERT INTO resultado_exame (id_resultado, id_item_pedido, valor_numerico, unidade, texto_resultado, data_hora)
VALUES (1, 1, 6.0, 'x10^3', 'Hemograma dentro dos limites', DATE '2024-09-11');

INSERT INTO resultado_exame (id_resultado, id_item_pedido, valor_numerico, unidade, texto_resultado, data_hora)
VALUES (2, 2, 85, 'mg/dL', 'Glicose normal', DATE '2024-09-11');

INSERT INTO resultado_exame (id_resultado, id_item_pedido, valor_numerico, unidade, texto_resultado, data_hora)
VALUES (3, 4, 92, 'mg/dL', 'Glicose levemente elevada', DATE '2024-09-13');

INSERT INTO resultado_exame (id_resultado, id_item_pedido, valor_numerico, unidade, texto_resultado, data_hora)
VALUES (4, 5, 5.5, 'x10^3', 'Hemograma estável', DATE '2024-09-16');


-- INSERTS TABELA LAUDO
INSERT INTO laudo (id_laudo, id_resultado, id_medico, texto_laudo, data_emissao)
VALUES (1, 1, 1, 'Exame dentro da normalidade.', DATE '2024-09-11');

INSERT INTO laudo (id_laudo, id_resultado, id_medico, texto_laudo, data_emissao)
VALUES (2, 2, 2, 'Resultados normais.', DATE '2024-09-11');

INSERT INTO laudo (id_laudo, id_resultado, id_medico, texto_laudo, data_emissao)
VALUES (3, 3, 2, 'Glicose discretamente elevada, recomendar acompanhamento.', DATE '2024-09-13');

INSERT INTO laudo (id_laudo, id_resultado, id_medico, texto_laudo, data_emissao)
VALUES (4, 4, 1, 'Hemograma estável e sem alterações significativas.', DATE '2024-09-16');
