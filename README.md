# AWS na Prática --- API REST com LoopBack, Docker e MySQL

Projeto desenvolvido durante o curso **AWS na Prática**, com foco em
colocar uma API REST em funcionamento utilizando **Node.js +
LoopBackJS**, **Docker**, **MySQL** e serviços da **AWS**.

O projeto começou como uma API CRUD de produtos executada em ambiente
Docker e evoluiu para um deployment em nuvem, com a aplicação hospedada
em uma instância **Amazon EC2** e o banco de dados utilizando **Amazon
RDS (MySQL)**.

> Projeto com finalidade educacional, desenvolvido para praticar
> desenvolvimento de APIs, containers, banco de dados e fundamentos de
> infraestrutura em nuvem.

------------------------------------------------------------------------

## 🚀 Sobre o projeto

A aplicação é uma API REST construída com **LoopBack 4**, framework
baseado em Node.js, disponibilizando operações CRUD para o recurso
`Product`.

O projeto permite praticar, de ponta a ponta:

-   criação de uma API REST;
-   modelagem de dados;
-   integração com MySQL;
-   execução da aplicação em Docker;
-   gerenciamento de processos com PM2;
-   configuração de uma aplicação em uma instância EC2;
-   conexão com banco de dados MySQL no RDS;
-   configuração de acesso de rede através do Security Group;
-   publicação de uma API acessível externamente.

------------------------------------------------------------------------

## 🏗️ Arquitetura

``` text
                    Internet
                       │
                       │ HTTP :3001
                       ▼
              ┌───────────────────┐
              │    AWS EC2        │
              │                   │
              │  Docker           │
              │  ┌─────────────┐  │
              │  │ LoopBack API│  │
              │  │    + PM2    │  │
              │  └──────┬──────┘  │
              └─────────┼─────────┘
                        │
                        │ MySQL :3306
                        ▼
              ┌───────────────────┐
              │    AWS RDS        │
              │      MySQL        │
              └───────────────────┘
```

### Fluxo da aplicação

1.  O cliente envia uma requisição HTTP para a API.
2.  O Security Group da EC2 controla o acesso à porta da aplicação.
3.  O Docker encaminha a requisição para o container da API.
4.  O LoopBack processa a requisição.
5.  Quando necessário, a API acessa o banco MySQL hospedado no RDS.
6.  A resposta é devolvida ao cliente.

------------------------------------------------------------------------

## 🛠️ Tecnologias utilizadas

  Tecnologia                Utilização
  ------------------------- ------------------------------------------
  **Node.js**               Runtime da aplicação
  **LoopBack 4**            Framework para construção da API REST
  **Express.js**            Camada utilizada pela aplicação LoopBack
  **TypeScript**            Desenvolvimento da aplicação
  **MySQL**                 Banco de dados relacional
  **Docker**                Containerização da aplicação
  **Docker Compose**        Orquestração do ambiente local
  **PM2**                   Gerenciamento dos processos da API
  **Amazon EC2**            Hospedagem da aplicação
  **Amazon RDS**            Banco de dados MySQL gerenciado
  **AWS Security Groups**   Controle de acesso à aplicação

------------------------------------------------------------------------

## 📁 Estrutura do repositório

``` text
.
├── docker/
│   └── # Dockerfiles e scripts relacionados ao ambiente
│
├── www/
│   └── api/
│       └── # Código-fonte da API LoopBack
│
├── docker-compose.yml
└── README.md
```

A estrutura segue a organização utilizada durante o projeto, separando a
infraestrutura Docker do código da API.

------------------------------------------------------------------------




