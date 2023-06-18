create table usuario (
  id_usuario serial primary key NOT NULL,
  nome_usuario varchar(50) NOT NULL
);

insert into usuario (nome_usuario) values ('Rodrigo'), ('Carlos'), ('Maria'), ('Jose'), ('Ana'), ('Pedro');

create table viagem (
  id_viagem serial primary key NOT NULL,
  destino varchar(150) NOT NULL,
  data_viagem date NOT NULL,
  valor_passagem numeric(10,2) NOT NULL
);

insert into viagem values 
(1, 'São Paulo', '2020-07-01', 100.00), 
(2, 'Rio de Janeiro', '2020-07-01', 200.00), 
(3, 'Belo Horizonte', '2020-07-01', 300.00), 
(4, 'São Paulo', '2020-07-01', 100.00), 
(5, 'Rio de Janeiro', '2020-07-01', 200.00), 
(6, 'Belo Horizonte', '2020-07-01', 300.00), 
(7, 'São Paulo', '2020-07-01', 100.00), 
(8, 'Rio de Janeiro', '2020-07-01', 200.00), 
(9, 'Belo Horizonte', '2020-07-01', 300.00), 
(10, 'São Paulo', '2020-07-01', 100.00), 
(11, 'Rio de Janeiro', '2020-07-01', 200.00), 
(12, 'Belo Horizonte', '2020-07-01', 300.00);

create table reserva (
  id_usuario integer NOT NULL,
  id_viagem integer NOT NULL,
  data_reserva date NOT NULL,
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_viagem) references viagem(id_viagem)
);

insert into reserva values 
(1, 1, '2020-05-03'), 
(2, 2, '2020-06-01'), 
(3, 3, '2020-07-01'), 
(4, 4, '2020-05-01'), 
(5, 5, '2020-07-01'), 
(6, 6, '2020-08-01'), 
(1, 7, '2022-07-01'), 
(1, 8, '2023-08-01'), 
(2, 9, '2018-06-01'), 
(3, 10, '2019-07-01'), 
(5, 11, '2020-09-01'), 
(5, 12, '2020-07-01');

--Ordene os usuários que mais gastaram em reservas de viagens no mês de julho, independente do ano. Esse script deve conter o nome do usuário e o valor total gasto nas reservas no mês de julho
select usuario.nome_usuario, sum(viagem.valor_passagem) as "Total Gasto em Julho"
from reserva
inner join usuario on reserva.id_usuario = usuario.id_usuario
inner join viagem on reserva.id_viagem = viagem.id_viagem
where date_part('month', reserva.data_reserva) = 7
group by usuario.nome_usuario
order by "Total Gasto em Julho" desc;

