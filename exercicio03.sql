insert into usuario (nome, login, senha, email, dataNascimento, cpf, rg) values ('Derpson da Silva', 'derpinho', 'derpinho91', 'derpinho91@hotmail.com','1991-01-01', '123.123.123-12', 4123123);

insert into genero (descricao) values ('Simulação da Vida Real');

insert into jogo (nome, plataformas, genero_id, foto, video) values ('The Sims 4 Base', 'Playstation 4, Playstation 5, Desktop', 1, 'https://cdn-products.eneba.com/resized-products/1J6X6X-350x200.jpg', 'https://www.youtube.com/watch?v=U0Yw7Q0Z0g0');

insert into bibliotecausuario (usuario_id, jogo_id) values (1, 1);