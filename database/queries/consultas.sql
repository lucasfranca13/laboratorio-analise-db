-- queries dos registros
-- lista exames com laudo emitido
SELECT
    l.id_laudo,
    l.data_emissao,
    c.nome AS cliente,
    te.nome AS exame,
    m.nome AS medico_responsavel
FROM laudo l
JOIN resultado_exame r ON r.id_resultado = l.id_resultado
JOIN item_pedido ip ON ip.id_item_pedido = r.id_item_pedido
JOIN pedido_exame pe ON pe.id_pedido = ip.id_pedido
JOIN atendimento a ON a.id_atendimento = pe.id_atendimento
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
JOIN medico m ON m.id_medico = l.id_medico
ORDER BY l.data_emissao DESC;


-- traz o histórico completo de todos os exames de um cliente
SELECT
    c.nome AS cliente,
    te.nome AS exame,
    ip.status,
    r.valor_numerico,
    r.unidade,
    l.texto_laudo,
    l.data_emissao
FROM cliente c
JOIN atendimento a ON a.id_cliente = c.id_cliente
JOIN pedido_exame pe ON pe.id_atendimento = a.id_atendimento
JOIN item_pedido ip ON ip.id_pedido = pe.id_pedido
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
LEFT JOIN resultado_exame r ON r.id_item_pedido = ip.id_item_pedido
LEFT JOIN laudo l ON l.id_resultado = r.id_resultado
WHERE c.nome = 'José Geraldo';


-- total de exames realizados por cada técnico
SELECT 
    t.nome AS tecnico,
    COUNT(*) AS total_exames
FROM procedimento p
JOIN tecnico t ON t.id_tecnico = p.id_tecnico
GROUP BY t.nome
ORDER BY total_exames DESC;


-- quantidade de exames realizados por cliente
SELECT 
    c.nome AS cliente,
    COUNT(ip.id_item_pedido) AS total_exames
FROM cliente c
LEFT JOIN atendimento a ON a.id_cliente = c.id_cliente
LEFT JOIN pedido_exame pe ON pe.id_atendimento = a.id_atendimento
LEFT JOIN item_pedido ip ON ip.id_pedido = pe.id_pedido
GROUP BY c.nome
ORDER BY total_exames DESC;


--quantidades de laudos emitidos por médicos
SELECT 
    m.nome AS medico,
    COUNT(l.id_laudo) AS laudos_emitidos
FROM medico m
LEFT JOIN laudo l ON l.id_medico = m.id_medico
GROUP BY m.nome
ORDER BY laudos_emitidos DESC;


-- total de exames por categoria (LAB x IMAGEM)
SELECT 
    te.categoria,
    COUNT(*) AS total_exames
FROM item_pedido ip
JOIN tipo_exame te ON te.id_tipo_exame = ip.id_tipo_exame
GROUP BY te.categoria;
