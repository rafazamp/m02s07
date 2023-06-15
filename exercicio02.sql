create table usuario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  login VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  dataNascimento DATE NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  rg INTEGER NOT NULL,
  check (current_date - dataNascimento >= 18 )
);

create table genero (
  id SERIAL PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL
);

create table jogo (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  plataformas VARCHAR(100) NOT NULL,
  genero_id INTEGER NOT NULL,
  foto VARCHAR(200) NOT NULL,
  video VARCHAR(200) NOT NULL,
  foreign key (genero_id) references genero (id)
);

create table bibliotecausuario (
  usuario_id INTEGER NOT NULL,
  jogo_id INTEGER NOT NULL,
  foreign key (usuario_id) references usuario (id),
  foreign key (jogo_id) references jogo (id)
);

