--Autor: Rafael Daily Santos Martins
--Contato: rafaeldaily1414@gmail.com

--Insere um novo funcionário
INSERT INTO tb_membros (nome, cargo)
VALUES 
	($1, $2)

--Retorna todos os dados de todos funcionários
SELECT * FROM tb_membros

--Retorna os dados de um funcionário específico
SELECT * FROM tb_membros WHERE id = $1

--Altera os dados de um funcionário
UPDATE tb_membros 
SET nome = $2, cargo = $3
WHERE id = $1

--Deleta um funcionário
DELETE FROM tb_membros WHERE id = $1