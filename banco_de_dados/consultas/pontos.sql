--Autor: Rafael Daily Santos Martins
--Contato: rafaeldaily1414@gmail.com

--Insere um registro de ponto na data e horário do sistema do banco
INSERT INTO tb_pontos (membroid, dia, hora, minuto, tipo, atraso)
VALUES 
($1, current_date, EXTRACT (HOUR FROM NOW()), EXTRACT (MINUTE FROM NOW()), $2, $3)
	
--Mostra todos os registros de pontos
SELECT * FROM tb_pontos

/*Retorna uma tabela com todas as faltas de todos os membros em um determinado período de tempo
para um membro específico*/
SELECT 
	h.membroid, 
	c.data, 
	c.dia_semana,
	CASE
		WHEN h.tipo = 'entrada' THEN h.hora_entrada
		WHEN h.tipo = 'saida' THEN h.hora_saida
		ELSE NULL
	END as hora,
	h.tipo,
	CASE
		WHEN p.atraso is NULL THEN 'Falta'
		WHEN p.atraso > 0 THEN 'Atraso'
		ELSE NULL
	END as atraso_ou_falta,
	CASE
		WHEN p.atraso IS NULL THEN 0
		WHEN p.atraso > 0 THEN p.atraso
		ELSE NULL
	END as atraso
FROM 
	(SELECT *, 'entrada' as tipo FROM tb_horarios
	UNION ALL
	SELECT *, 'saida' as tipo FROM tb_horarios) h 
LEFT JOIN 
	tb_calendario c 
ON h.dia_semana = c.dia_semana
LEFT JOIN
	tb_pontos p
ON p.membroid = h.membroid AND p.dia = c.data AND p.tipo = h.tipo
WHERE
	(p.id IS NULL OR p.atraso>0)
	AND c.id >= $1 AND c.id<=$2
	AND h.membroid = $3
ORDER BY c.id


--Retorna uma tabela com todas as faltas de todos os membros em um determinado período de tempo
SELECT 
	h.membroid, 
	c.data, 
	c.dia_semana,
	CASE
		WHEN h.tipo = 'entrada' THEN h.hora_entrada
		WHEN h.tipo = 'saida' THEN h.hora_saida
		ELSE NULL
	END as hora,
	h.tipo,
	CASE
		WHEN p.atraso is NULL THEN 'Falta'
		WHEN p.atraso > 0 THEN 'Atraso'
		ELSE NULL
	END as atraso_ou_falta,
	CASE
		WHEN p.atraso IS NULL THEN 0
		WHEN p.atraso > 0 THEN p.atraso
		ELSE NULL
	END as atraso
FROM 
	(SELECT *, 'entrada' as tipo FROM tb_horarios
	UNION ALL
	SELECT *, 'saida' as tipo FROM tb_horarios) h 
LEFT JOIN 
	tb_calendario c 
ON h.dia_semana = c.dia_semana
LEFT JOIN
	tb_pontos p
ON p.membroid = h.membroid AND p.dia = c.data AND p.tipo = h.tipo
WHERE
	(p.id IS NULL OR p.atraso>0)
	AND c.id >= $1 AND c.id<=$2
ORDER BY c.id