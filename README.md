
<h2 align="center"> 
    :construction:  Projeto em construção  :construction:
</h2>

# Controle de Presença (Ponto Eletrônico)

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)


![image](https://user-images.githubusercontent.com/119074384/215282635-53443d7a-c311-4fa8-acc6-c5f9bbef17d1.png)





# Descrição do Projeto
Este projeto se refere à um software construído para um trabalho final da disciplina Tecnologia Web e Mobile do curso de Engenharia da Computação pela Universidade Federal de Uberlândia (UFU). O sistema tem como finalidade controlar presenças e faltas de membros de uma Empresa  (como um Ponto Eletrônico).

O sistema possuirá um cadastro de membros, terá a possibilidade de registrar presenças tanto de entrada como de saída, gerará um relatório com todas as faltas de cada membro a partir de um determinado dia e também permitirá que os funcionários visualizem suas própias faltas a partir de um aplicativo mobile.


# Funcionalidades

- `Funcionalidades do Administrador`: Apenas o adminstrador (podendo ser o gerente de RH) conseguirá acessar estas funcionalidades, para isso elas estarão protegidas por login e senha:
    - `Cadastro de Usuários`: Realizar a inserção, alteração e remoção de funcionários e suas informações a respeito de horários de trabalho.
    - `Relatório de Faltas`: Um relatório contendo todas as faltas de todos os funcionários em um determinado período de tempo.
- `Funcionalidades dos funcionários`: Estas funcionalidades estarão disponíveis para todos os funcionários (para o caso das Faltas do Usuário, haverá um login para que apenas o funcionário com senha consiga visualizar suas faltas):
    - `Registro de Presença`: Permitir que os funcionários batam ponto de entrada ou saída. Haverá uma tolerância de atraso de 10 min para registros de entrada ou saída (os funcionários também não poderão bater o ponto se faltam mais do que 10 min para dar o horário de entrada ou saída).
    - `Faltas do Usuário`: Cada usuário visualizará somentes as suas própias faltas dentro do app.

# Etapas do Projeto

O projeto será divido em 4 etapas:

1. `Banco de Dados:` Criar Tabelas, Relacionamentos e Consultas que serão realizadas pelo back-end.

2. `Back-end:` Criar a API com as funcionalidades requeridas, assim como todas as rotas necessárias para que o sistema funcione tanto para o front-end como para o mobile.

3. `Front-end:` Apresentar no navegador web as funcionalidades de cadastro, registro de presença e relatório de faltas.

4. `Mobile:` Criar um app mobile que permita que os funcionários possam visualizar suas própias faltas.

Cada etapa terá uma pasta própia aqui no GitHub para uma melhor organização.
