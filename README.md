# Biblioteca-Rails

Simples aplicação web desenvolvida em ruby 2.5.1 e utilizado o framework rails 5.2.0 e banco de dado sqlite 3. O aplicativo é um tipo muito simples de CMS (sistema de gerenciamento de conteúdo) que permite gerenciar o empréstimo de livros e além das funcionalidades simples de um [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete).

Para testar o aplicativo em seu ambiente local utilize o [Docker](https://docs.docker.com/install/) e [Docker Compose](https://docs.docker.com/compose/) e depois execute o seguinte comandos:

```bash
git clone https://github.com/luccasPh/biblioteca.git
cd biblioteca
docker-compose build
docker-compose run web rake db:migrate
docker-compose up
```

Depois e só acessar http://localhost:3000
