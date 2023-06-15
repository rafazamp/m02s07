create table ator (
  ator_id serial primary key,
  nome varchar(100),
  dataNascimento date,
  altura numeric(3,2),
  peso numeric(5,2)
);

create table filme (
  filme_id serial primary key,
  nome varchar(100),
  duracaoMinutos integer
);

create table genero (
  genero_id serial primary key,
  nome varchar(50)
);

create table genero_filme (
  filme_id integer,
  genero_id integer,
  foreign key (filme_id) references filme (filme_id),
  foreign key (genero_id) references genero (genero_id)
);

insert into genero (nome) values ('Ação'), ('Aventura'),('Comédia'), ('Drama'), ('Ficção Científica'), ('Romance'), ('Terror');

insert into filme (nome, duracaoMinutos) values ('O senhor dos Anéis', 300), ('Rambo', 90), ('Stallone Cobra', 90);

insert into genero_filme (filme_id, genero_id) values (1, 2), (2, 1), (3, 1);

insert into ator (nome, dataNascimento, altura, peso) values ('Sylvester Stallone', '1946-07-06', 1.77, 96), ('Orlando Bloom', '1977-01-13', 1.80, 70), ('Elijah Wood', '1981-01-28', 1.68, 70);

select filme.nome, filme.duracaoMinutos from filme
inner join genero_filme on filme.filme_id = genero_filme.filme_id
inner join genero on genero_filme.genero_id = genero.genero_id
where genero.nome = 'Ação';