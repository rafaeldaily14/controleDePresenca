--Autor: Rafael Daily Santos Martins
--Contato: rafaeldaily1414@gmail.com

--Insere um novo usario e senha para um funcionario
INSERT INTO tb_senhas (membroid, usuario, senha) VALUES ($1, $2, $3)

--Retorna o a senha e o id da tb_membros do funcionario a partir do nome de usuario informado	
SELECT * FROM tb_senhas WHERE usuario = $1
