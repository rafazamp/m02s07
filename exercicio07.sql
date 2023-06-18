create table usuario (
  id_usuario serial primary key NOT NULL,
  nome_usuario varchar(50) NOT NULL
);

create table produto (
  id_produto serial primary key NOT NULL,
  nome_produto varchar(150) NOT NULL
);

create table venda (
  id_usuario integer NOT NULL,
  id_produto integer NOT NULL,
  valor_produto numeric(10,2) NOT NULL,
  quantidade_produto integer NOT NULL,
  dt_compra date NOT NULL,
  foreign key (id_usuario) references usuario(id_usuario),
  foreign key (id_produto) references produto(id_produto)
);

insert into usuario (nome_usuario) values ('João'), ('Maria'), ('Jose'), ('Ana'), ('Pedro');

insert into produto (nome_produto) values ('camisa'), ('calca'), ('tenis'), ('meia'), ('bermuda'), ('notebook'), ('celular'), ('tablet'), ('tv'), ('geladeira');

insert into venda (id_usuario, id_produto, valor_produto, quantidade_produto, dt_compra) values
(1, 1, 50.00, 1, '2019-11-25'),
(1, 2, 100.00, 2, '2020-01-25'),
(1, 3, 200.00, 1, '2020-07-25'),
(1, 4, 10.00, 4, '2024-05-25'),
(1, 5, 30.00, 1, '2023-11-30'),
(1, 6, 2000.00, 1, '2018-06-25'),
(1, 7, 1500.00, 5, '2017-10-25'),
(1, 8, 1000.00, 1, '2012-12-25'),
(1, 9, 2000.00, 2, '2013-08-25'),
(1, 10, 3000.00, 3, '2020-11-01'),
(2, 1, 50.00, 2, '2019-07-25'),
(2, 2, 100.00, 3, '2020-11-25'),
(2, 3, 200.00, 2, '2020-08-25'),
(2, 4, 10.00, 4, '2024-06-25'),
(2, 5, 30.00, 5, '2023-12-30'),
(2, 6, 2000.00, 1, '2018-11-25'),
(2, 7, 1500.00, 1, '2017-11-25'),
(2, 8, 1000.00, 1, '2012-02-25'),
(2, 9, 2000.00, 1, '2013-08-25'),
(2, 10, 3000.00, 1, '2020-05-01'),
(3, 1, 50.00, 2, '2019-06-25'),
(3, 2, 100.00, 1, '2020-05-25'),
(3, 3, 200.00, 2, '2020-11-25'),
(3, 4, 10.00, 2, '2024-05-25'),
(3, 5, 30.00, 1, '2023-11-30'),
(3, 6, 2000.00, 2, '2018-10-25'),
(3, 7, 1500.00, 1, '2017-09-25'),
(3, 8, 1000.00, 2, '2012-02-25'),
(3, 9, 2000.00, 2, '2013-08-25'),
(3, 10, 3000.00, 1, '2020-11-01'),
(4, 1, 50.00, 5, '2019-07-25'),
(4, 2, 100.00, 2, '2020-11-25'),
(4, 3, 200.00, 1, '2020-08-25'),
(4, 4, 10.00, 1, '2024-06-25'),
(4, 5, 30.00, 2, '2023-12-30'),
(4, 6, 2000.00, 2, '2018-11-25'),
(4, 7, 1500.00, 1, '2017-10-25'),
(4, 8, 1000.00, 3, '2012-02-25'),
(4, 9, 2000.00, 1, '2013-08-25'),
(4, 10, 3000.00, 1, '2020-05-01'),
(5, 1, 50.00, 10, '2019-07-25'),
(5, 2, 100.00, 4, '2020-06-25'),
(5, 3, 200.00, 3, '2020-08-25'),
(5, 4, 10.00, 7, '2024-06-25'),
(5, 5, 30.00, 2, '2023-12-30'),
(5, 6, 2000.00, 1, '2018-05-25'),
(5, 7, 1500.00, 2, '2017-11-25'),
(5, 8, 1000.00, 2, '2012-02-25'),
(5, 9, 2000.00, 3, '2013-11-25'),
(5, 10, 3000.00, 1, '2020-05-01');

--Ordene os usuários que mais gastaram no mes de novembro, independente do ano. Esse script deve conter o nome do usuário e o valor total gasto no mes de novembro
select usuario.nome_usuario, sum(venda.valor_produto*venda.quantidade_produto) as "Valor Total Compras Novembro" 
from usuario
inner join venda on venda.id_usuario = usuario.id_usuario
inner join produto on produto.id_produto = venda.id_produto
where extract(month from venda.dt_compra) = 11
group by usuario.nome_usuario
order by "Valor Total Compras Novembro" desc;