# Banco de Dados

A imagem abaixo apresenta um diagrama de classes mostrando as tabelas, os campos e os relacionamentos necessários para a construção do banco de dados da aplicação.

<p align="center">
<img src="https://user-images.githubusercontent.com/119074384/215357368-c0db2bcb-6ba1-499e-b11a-3f711e97eb29.jpeg" width="700" />
</p>

# Tabelas e Colunas

Tomei a liberdade de não explicar todos campos, já que alguns são auto-explicativos. Entretanto alguns campos valem a explicação:

- `tb_membros`: Contém os dados dos funcionários. Estas são suas colunas:
  - `id`
  - `nome`
  - `cargo`
- `tb_horarios`: Contém os horários que os funcionários devem bater o ponto:
  - `id`
  - `membroid`: mesmo id da tabela tb_membros.
  - `dia_semana`: número que indica o dia da semana (domingo, segunda, terça, etc.).
  - `hora_entrada`: texto indicando a hora em que o membro deve bater o ponto de entrada no formato HH:MM.
  - `hora_saida`: texto indicando a hora em que o membro deve bater o ponto de saida no formato HH:MM.
- `tb_pontos`: Contém os registros de quando os membros bateram pontos de entrada ou saída:
  - `id`
  - `membroid`
  - `dia`
  - `hora`
  - `minuto`
  - `tipo`: pondendo ser "entrada" ou "saída".
  - `atraso`: Caso a pessoa que bateu o ponto estava atrasada, esse campo indicará quantos minutos ela estava atrasada.
- `tb_senhas`: Contém o login e senha de cada um dos funcionarios que eles utilizam para acessar o app e ver suas própias faltas (em uma aplicação segura, deveria criptografar este conteúdo e salvar apenas o hash, porém como esta aplicação tem o intuito de fins didáticos não voltados para a segurança, tomei a liberdade de salvar em texto aberto):
  - `id`
  - `membroid`
  - `usuario`
  - `senha`
- `tb_calendario`: Contém todos os dias a partir de 01/01/2020 até 31/12/2100
  - `id`
  - `data`
  - `dia_semana`
  - `dia_util`: indica 0 se não for dia útil e 1 se for dia útil (a princípio apenas dias que são sábado e domingo não serão considerados como dia útil, feriados em dia de semana ainda serão considerados como dia útil).
- `tb_dia_semana`: Contém uma relação entre o id usado pelo dia_semana nas outras tabelas e o real nome destes dias da semana
  - `id`
  - `nome_dia_semana`

# Instalação e Backup

Neste projeto, foi utilizado o PostgreSQL, mas você consegue replicar o banco quem qualquer SGBD de sua preferência, apenas não garanto que os códigos SQL feitos neste projeto irão funcionar de forma adequada. Para baixar o PostgreSQL pode acessar este link: https://www.postgresql.org/download/. Também recomendo a instalação da interface pgAdmin: https://www.pgadmin.org/download/

Antes de criar as tabelas, você deve criar um banco de dados. Neste projeto, demos o nome do banco de `bd_banco_de_dados`. Você pode criar o banco usando o pgAdmin ou executando o comando no postgres: `CREATE DATABASE bd_banco_de_dados;`

O arquivo `backup.sql` contém um código SQL que criará todas as tabelas que será utilizado pelo sistema e populá-las com alguns dados, então basta executá-lo usando o query tool do pgAdmin (ou de outra forma que preferir) e terá o banco pronto para ser utilizado.

# Queries

Dentro da pasta `consultas` está todas as queries que são utilizadas pelo back-end. Cada uma delas possui um comentário descrevendo o que ela faz. Não é necessário baixa-las ou executa-las, estão lá apenas para aprendizado.

# SGBD utilizado e sua versão
<p>
<img src="https://user-images.githubusercontent.com/119074384/215299336-614d29de-be05-45be-b373-0ded9c7efb5a.png" width="40" />
PostgreSQL 13.2
</p>



  
