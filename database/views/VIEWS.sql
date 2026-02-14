-- Views
-- mostra os exames que já possuem resultado liberado
CREATE OR REPLACE VIEW vw_resultados_prontos AS
SELECT
    c.nome AS nome_cliente,
    r.id_resultado,
    r.data_hora AS data_resultado,
    r.valor_numerico,
    r.unidade,
    r.texto_resultado,
    ip.id_item_pedido,
    te.nome AS nome_exame,
    a.id_atendimento
FROM resultado_exame r
JOIN item_pedido ip ON ip.id_item_pedido = r.id_item_pedido
JOIN pedido_exame pe ON pe.id_pedido = ip.id_pedido
JOIN atendimento a ON a.id_atendimento = pe.id_atendimento
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame;

SELECT *
FROM vw_resultados_prontos
WHERE nome_cliente LIKE 'Paulo%';


-- mostra exames que já possuem laudo médico, prontos para o paciente acessar
CREATE OR REPLACE VIEW vw_laudos_liberados AS
SELECT
    l.id_laudo,
    l.data_emissao,
    l.texto_laudo,
    m.nome AS medico_responsavel,
    r.id_resultado,
    te.nome AS exame,
    c.nome AS cliente
FROM laudo l
JOIN resultado_exame r ON r.id_resultado = l.id_resultado
JOIN item_pedido ip ON ip.id_item_pedido = r.id_item_pedido
JOIN pedido_exame pe ON pe.id_pedido = ip.id_pedido
JOIN atendimento a ON a.id_atendimento = pe.id_atendimento
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
JOIN medico m ON m.id_medico = l.id_medico;


SELECT exame, cliente, medico_responsavel
FROM vw_laudos_liberados;



-- mostra exames ainda sem resultado

CREATE OR REPLACE VIEW vw_exames_pendentes AS
SELECT
    ip.id_item_pedido,
    te.nome AS exame,
    te.categoria,
    c.nome AS cliente,
    a.data_hora AS data_atendimento,
    ip.status
FROM item_pedido ip
JOIN pedido_exame pe ON pe.id_pedido = ip.id_pedido
JOIN atendimento a ON a.id_atendimento = pe.id_atendimento
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
LEFT JOIN resultado_exame r ON r.id_item_pedido = ip.id_item_pedido
WHERE r.id_resultado IS NULL;


SELECT *
FROM vw_exames_pendentes
ORDER BY data_atendimento;


-- mostra exames com horário marcado junto ao técnico
CREATE OR REPLACE VIEW vw_exames_agendados AS
SELECT
    ag.id_agendamento,
    ag.data_hora,
    ag.sala_ou_box,
    tc.nome AS tecnico,
    te.nome AS exame,
    c.nome AS cliente
FROM agendamento ag
JOIN item_pedido ip ON ip.id_item_pedido = ag.id_item_pedido
JOIN pedido_exame pe ON pe.id_pedido = ip.id_pedido
JOIN atendimento a ON a.id_atendimento = pe.id_atendimento
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
LEFT JOIN tecnico tc ON tc.id_tecnico = ag.id_tecnico;


SELECT *
FROM vw_exames_agendados
ORDER BY data_hora;


-- traz o histórico completo de todos os exames de um cliente
CREATE OR REPLACE VIEW vw_historico_exames_cliente AS
SELECT
    c.id_cliente,
    c.nome AS cliente,
    a.id_atendimento,
    te.nome AS exame,
    ip.status,
    r.valor_numerico,
    r.unidade,
    r.texto_resultado,
    l.texto_laudo,
    l.data_emissao AS data_laudo
FROM cliente c
JOIN atendimento a ON a.id_cliente = c.id_cliente
JOIN pedido_exame pe ON pe.id_atendimento = a.id_atendimento
JOIN item_pedido ip ON ip.id_pedido = pe.id_pedido
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
LEFT JOIN resultado_exame r ON r.id_item_pedido = ip.id_item_pedido
LEFT JOIN laudo l ON l.id_resultado = r.id_resultado;

SELECT *
FROM vw_historico_exames_cliente
WHERE id_cliente = 1;