# Teste iCasei: Back-end
Desenvolver uma aplicação de Rastreamento de usuários

## Instruções
- Faça um fork desse projeto para a sua conta pessoal do GitHub.
- Siga as especificações abaixo.
- Crie um README em inglês que explique como rodar localmente a aplicação (iremos testar e rodar a aplicação a partir desse manual, inclusive criação de base de dados)
- Devem existir testes automatizados. Quanto mais bem testada a aplicação, melhor.
- O link do repositório deverá ser enviado para o e-mail backend@icasei.com.br com o título **Teste Back-End Developer**

## Especificações tecnicas
- Desenvolver uma aplicação usando Ruby on Rails que contenha uma lista de contatos. Deve obrigatoriamente conter o campo **email** e **nome**.
- Desenvolver uma biblioteca em JavaScript que quando incluída no site do cliente envie as seguintes informações para a sua aplicação:
  - Identificador único do visitante (GUID) (Usar cookies ou local storage) 
  - URL acessada
  - Data/hora do acesso
- Criar um site de exemplo contendo pelo menos 3 páginas utilizando a biblioteca JS desenvolvida
- O site de exemplo deve conter uma página de contato com um formulário que envie o contato para sua aplicação. Esse formulário deve ter os campos “nome” e "email" onde “email” servirá como identificador único do contato.
- Deverá haver uma página que mostre um relatório de rastreamento  dos últimos 50 acessos rastreados ordenados em ordem decrescente por data de inserção.

## Espera-se que funcione da seguinte forma:
- O visitante "A" acessa a página "Home" da sua página de exemplo.
- O visitante "A" acessa a página de "Sobre" da sua página de exemplo.
- O visitante "B" acessa a página "Home" da sua página de exemplo.
- O visitante "B" acessa a página "Contato" da sua página de exemplo.
- O visitante "B" preenche o formulário e confirma.
- É criado um contato em sua aplicação para o Visitante "B".
- Ao acessar a página de relatório na aplicação é possível ver as seguintes páginas:
  - Visitante A | Home | Data/Hora
  - Visitante A | Sobre | Data/Hora
  - Visitante B | Home | Data/Hora
  - Visitante B | Contato | Data/Hora
- O visitante "A" acessa a página "Contato" da sua página de exemplo.
- O visitante "A" preenche o formulário e confirma.
- É criado um contato em sua aplicação para o Visitante "A".
- Ao acessar a página de relatório na aplicação é possível ver as seguintes páginas:
  - Visitante A | Home | Data/Hora
  - Visitante A | Sobre | Data/Hora
  - Visitante B | Home | Data/Hora
  - Visitante B | Contato | Data/Hora
  - Visitante A | Contato | Data/Hora
- O visitante "B" acessa a página "Sobre" da página de exemplo.
- Ao acessar a página de relatório na aplicação é possível ver as seguintes páginas:
  - Visitante A | Home | Data/Hora
  - Visitante A | Sobre | Data/Hora
  - Visitante B | Home | Data/Hora
  - Visitante B | Contato | Data/Hora
  - Visitante A | Contato | Data/Hora
  - Visitante B | Sobre | Data/Hora
  
Fique atento a problemas de performance e concorrência em uma grande quantidade de requisições. Caso julgue necessário o desenvolvimento de outras bibliotecas ou serviços, pode utilizar a tecnologia que quiser.

## Obrigatório utilizar:
- Arquitetura microservicos com APIs RESTFUL
- Banco de dados relacional e no-sql
- Alguma ferramenta de mensageria
- Docker
- Cobertura de testes unitários

## O que será avaliado?
- Organização do projeto
- Lógica do código
- Uso do Git
- Uso de componentização
- Testes automatizados
