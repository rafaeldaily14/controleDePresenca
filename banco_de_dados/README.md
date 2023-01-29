# Banco de Dados

A imagem abaixo apresenta um diagrama de classes mostrando as tabelas, os campos e os relacionamentos necessários para a construção do banco de dados da aplicação.

<p align="center">
<img src="https://user-images.githubusercontent.com/119074384/215298968-e6e87670-d2af-4545-a060-9d04131caacf.jpeg" width="700" />
</p>

# Tabelas e Colunas

Tomei a liberdade de não explicar todos campos, já que alguns são auto-explicativos. Entretanto alguns campos valem a explicação:

- `tb_membros`: Contém os dados dos funcionários. Estas são suas colunas:
  - `id`
  - `nome`
  - `cargo`
  - `dia_semana`: número que indica o dia da semana (domingo, segunda, terça, etc.).
  - `hora_entrada`: texto indicando a hora em que o membro deve bater o ponto de entrada no formato HH:MM.
- `tb_pontos`: Contém os registros de quando os membros bateram pontos de entrada ou saída:
  - `id`
  - `membroid`: mesmo id da tabela tb_membros.
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
- `tb_calendario`: Contém todos os dias a partir de uma determinada até até outra determinada data
  - `id`
  - `data`
  - `dia_semana`
  - `dia_util`: indica 0 se não for dia útil e 1 se for dia útil (a princípio apenas dias que são sábado e domingo não serão considerados como dia útil, feriados em dia de semana ainda serão considerados como dia útil).
- `tb_dia_semana`: Contém uma relação entre o id usado pelo dia_semana nas outras tabelas e o real nome destes dias da semana
  - `id`
  - `nome_dia_semana`

# Backup

Um backup do banco será disponibilizado dentro da pasta banco_de_dados, assim como as consultas SQL que serão utilizadas pelo back-end.

# Banco utilizado e sua versão
<p>
<img src="https://user-images.githubusercontent.com/119074384/215299336-614d29de-be05-45be-b373-0ded9c7efb5a.png" width="40" />
PostgreSQL 13.2
</p>



  
