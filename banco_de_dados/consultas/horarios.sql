--Autor: Rafael Daily Santos Martins
--Contato: rafaeldaily1414@gmail.com

--insere um novo horário para um membro
INSERT INTO tb_horarios (membroid, dia_semana, hora_entrada, hora_saida) VALUES ($1, $2, $3, $4)

--Altera um horário
UPDATE tb_horarios 
SET dia_semana = $2, hora_entrada = $3, hora_saida = $4
WHERE id = $1

--Deleta um horário
DELETE FROM tb_horarios WHERE id = $1

--Retorna todos os horários de todos os membros
SELECT * FROM tb_horarios

--Retorna os horários de um membro específico
SELECT * FROM tb_horarios WHERE membroid = $1