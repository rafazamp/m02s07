create table pais (
	id_pais serial primary key,
	nome_pais VARCHAR (100) NOT NULL,
	continente VARCHAR (100) NOT NULL 
);

create table estado (
	id_estado serial primary key NOT NULL,
	id_pais INTEGER NOT NULL,
	nome_estado VARCHAR (100) NOT NULL,
	foreign key (id_pais) references pais (id_pais)
);

create table cidade (
	id_cidade serial primary key NOT NULL,
	nome_cidade VARCHAR (100) NOT NULL,
	id_estado INTEGER NOT NULL,
	capital BOOLEAN NOT NULL,
	qtd_populacao INTEGER NOT NULL,
	foreign key (id_estado) references estado (id_estado)
);

insert into pais (nome_pais, continente) values ('Brasil', 'América do Sul'), ('Argentina', 'América do Sul'), ('Estados Unidos', 'América do Norte'), ('Canadá', 'América do Norte'), ('México', 'América Central');

insert into estado (id_pais, nome_estado) values (1, 'São Paulo'), (1, 'Rio de Janeiro'), (2, 'Buenos Aires'), (2, 'Córdoba'), (3, 'Texas'), (3, 'Califórnia'), (4, 'Ontário'), (4, 'Quebec'), (5, 'Cidade do México'), (5, 'Guadalajara');

insert into cidade (nome_cidade, id_estado, capital, qtd_populacao) values ('São Paulo', 1, TRUE, 12325232), ('Rio de Janeiro', 2, TRUE, 15989929), ('Buenos Aires', 3, TRUE, 16529413), ('Córdoba', 4, FALSE, 3066801), ('Texas', 5, TRUE, 22859968), ('Califórnia', 6, FALSE, 39538223), ('Ontário', 7, TRUE, 13448494), ('Quebec', 8, FALSE, 492298), ('Cidade do México', 9, TRUE, 9209944), ('Guadalajara', 10, FALSE, 1495182);

select pais.nome_pais, estado.nome_estado, cidade.nome_cidade from pais
inner join estado on pais.id_pais = estado.id_pais
inner join cidade on cidade.id_estado = estado.id_estado
where cidade.capital = TRUE and cidade.qtd_populacao > 500000 and (estado.nome_estado like 'São%' or estado.nome_estado like 'Santo%' or estado.nome_estado like 'San%' or estado.nome_estado like 'Saint%') and (pais.continente = 'América do Norte' or pais.continente = 'América Central' or pais.continente = 'América do Sul')
order by pais.nome_pais, estado.nome_estado, cidade.nome_cidade;
