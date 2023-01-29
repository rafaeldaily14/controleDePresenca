--Autor: Rafael Daily Santos Martins
--Contato: rafaeldaily1414@gmail.com


/*Abaixo estão as queries que irão criar e popular as tabelas 
que usaremos no projeto, os dados colocados são fictícios e servirão para que
já tenhamos dados para trabalhar na hora de elaborar o back-end.*/

----------------------------------------------------------------

--Cria e popula a tabela de dias da semana

/*Esta tabela contém uma relação entre o id usado pelo dia_semana 
nas outras tabelas e o real nome destes dias da semana*/

CREATE TABLE tb_dia_semana (
	id INTEGER PRIMARY KEY,
	nome_dia_semana VARCHAR ( 50 )
);

INSERT INTO tb_dia_semana
VALUES (0,'domingo'),
(1,'segunda'),
(2,'terça'),
(3,'quarta'),
(4,'quinta'),
(5,'sexta'),
(6,'sábado');
----------------------------------

--Cria e popula a tabela de calendario

/*Contém todos os dias a partir de 01/01/2020 até 31/12/2100.
Para mudar as datas de começo e fim basta alterar as datas que estão na última linha desta seção*/

CREATE TABLE tb_calendario (
	id INTEGER,
	data DATE,
	dia_semana INTEGER,
	dia_util INTEGER,
	PRIMARY KEY(id),
   	CONSTRAINT fk_calendario
      	FOREIGN KEY(dia_semana) REFERENCES tb_dia_semana(id)
);

INSERT INTO tb_calendario
(SELECT 
	TO_CHAR(t.date,'yyyymmdd')::integer AS id,
	t.date::date, 
	DATE_PART('dow', t.date)::integer AS dia_semana,
	CASE 
		WHEN DATE_PART('dow', t.date) = 0 
			OR DATE_PART('dow', t.date) = 6 
		THEN 0
		ELSE 1
	END AS dia_util
FROM   generate_series(timestamp '2020-01-01', timestamp '2100-12-31', interval  '1 day') AS t(day));

----------------------------------

--Cria e popula a tabela de membros

/*Esta tabela contém os dados dos funcionários.*/

CREATE TABLE tb_membros (
	id SERIAL,
	nome VARCHAR(200),
	cargo VARCHAR(200),
	dia_semana INTEGER,
	hora_entrada VARCHAR(5),
	hora_saida VARCHAR(5),
	PRIMARY KEY(id),
   	CONSTRAINT fk_membros
      	FOREIGN KEY(dia_semana) REFERENCES tb_dia_semana(id)
);

INSERT INTO tb_membros (nome, cargo, dia_semana, hora_entrada, hora_saida)
VALUES 
	('Rafael', 'Presidente', 1, '10:00','11:00'),
	('Pedro', 'Consultor', 2, '10:00','11:00'),
	('Alice', 'VP', 3, '10:00','11:00'),
	('Carla', 'Gerente de RH', 4, '10:00','11:00'),
	('Paulo', 'Técnico', 5, '10:00','11:00');

----------------------------------

--Cria e popula a tabela de senhas

/*Esta tabela contém o login e senha de cada um dos funcionarios 
que eles utilizam para acessar o app e ver suas própias faltas*/

CREATE TABLE tb_senhas (
	id SERIAL,
	membroid INTEGER,
	usuario VARCHAR(200) UNIQUE,
	senha VARCHAR(200),
	PRIMARY KEY(id),
   	CONSTRAINT fk_senhas
      	FOREIGN KEY(membroid) REFERENCES tb_membros(id)
);


INSERT INTO tb_senhas (membroid, usuario, senha)
VALUES 
	(1, 'rafael', '1234'),
	(2, 'pedro', '1234'),
	(3, 'alice', '1234'),
	(4, 'carla', '1234'),
	(5, 'paulo', '1234');

----------------------------------
--Cria e popula a tabela de senhas

/*Esta tabela contém os registros de quando os membros 
bateram pontos de entrada ou saída*/

CREATE TABLE tb_pontos (
	id SERIAL,
	membroid INTEGER,
	dia DATE,
	hora INTEGER,
	minuto INTEGER,
	tipo VARCHAR(20),
	atraso INTEGER,
	PRIMARY KEY(id),
   	CONSTRAINT fk_senhas
      	FOREIGN KEY(membroid) REFERENCES tb_membros(id)
);

INSERT INTO tb_pontos (membroid, dia, hora, minuto, tipo, atraso)
VALUES 
	(1,'2023-01-16'::date, 10, 1, 'entrada', 0),
	(2,'2023-01-17'::date, 9, 58, 'entrada', 0),
	(3,'2023-01-18'::date, 10, 3, 'entrada', 0),
	(4,'2023-01-19'::date, 9, 59, 'entrada', 0),
	(5,'2023-01-20'::date, 10, 5, 'entrada', 0),
	
	(1,'2023-01-16'::date, 11, 1, 'saida', 0),
	(2,'2023-01-17'::date, 10, 58, 'saida', 0),
	(3,'2023-01-18'::date, 11, 3, 'saida', 0),
	(4,'2023-01-19'::date, 10, 59, 'saida', 0),
	(5,'2023-01-20'::date, 11, 5, 'saida', 0),
	
	(2,'2023-01-24'::date, 10, 15, 'entrada', 15),
	(2,'2023-01-24'::date, 11, 58, 'saida', 58),
	(3,'2023-01-25'::date, 11, 00, 'entrada', 60),
	(4,'2023-01-26'::date, 11, 59, 'saida', 59),
	(5,'2023-01-27'::date, 11, 20, 'saida', 20);

----------------------------------