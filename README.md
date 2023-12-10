# Driven-t - Sistema de Gerenciamento de Eventos 🚗💨

O Drivent é uma aplicação web para gerenciamento de eventos, oferecendo funcionalidades como: inscrições, aquisição de ingressos, reservas de hotel e muito mais. O sistema Driven-t foi criado para proporciona uma experiência otimizada tanto para organizadores quanto para participantes.

## 🚀 Recursos do código

- Inscrição e cadastro de usuários com verificação de CEP.
- Sistema de compra e gerenciamento de ingressos.
- Reservas de hotéis integrados ao evento.
- Sistema de migração e seed para banco de dados.
- Sistema de reserva de atividades 
- Rotas API para gestão de ingressos, hotéis, atividades e reservas.

## 🛠️ Tecnologias Utilizadas

- Node.js
- Typescript
- Express.js 
- Prisma (ORM).
- PostgreSQL. 
- Jest para testes.

## 📚 Guia de Instalação e Uso

1. Clone o repositório:
   - `git clone [https://github.com/natyhtpsm/drivent-backend]`

2. Instale as dependências:
   - `npm install`

3. Crie os bancos de dados locais (Postgres):
   - `CREATE DATABASE drivent_development;`
   - `CREATE DATABASE drivent_test;`

4. Configure os arquivos `.env.development` e `.env.test`.
   - `DATABASE_URL="postgresql://USER:PASSWORD@HOST:PORT/drivent_development"`    

6. Execute as migrações:
   - Para desenvolvimento: `npm run dev:migration:run`
   - Para testes: `npm run test:migration:run`

7. Execute o seed do banco de dados:
   - `npm run dev:seed`

8. Inicie o projeto:
   - `npm run dev`

## 🌐 Rotas e Funcionalidades

- **GET** `/enrollments/cep`: Busca de endereço por CEP.
- **POST** `/tickets`: Criação de ingressos.
- **GET** `/tickets`: Listagem de ingressos do usuário.
- **GET** `/booking`: Gerenciamento de reservas de hotel.
- **POST** `/booking`: Criação de uma nova reserva.
- **GET** `/hotels`: Listagem de hotéis.
- **GET** `/hotels/:hotelId`: Detalhes dos quartos de um hotel específico.
- **GET** `/activities`: Listagem de todas as atividades.
- **POST** `/activities/reservation`: Criação de uma reserva para uma atividade.
- **GET** `/activities/user`: Listagem das atividades escolhidas pelo usuário. 


