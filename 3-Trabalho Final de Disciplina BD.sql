--3. SQL de criação das tabelas
CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	usuario VARCHAR(100) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	sobrenome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	cpfcnpj BIGINT NOT NULL,
	datanascimento DATE NOT NULL
);

CREATE TABLE telefones (
	id SERIAL PRIMARY KEY,
	telefone1 BIGINT NOT NULL,
	telefone2 BIGINT,
	telefone3 BIGINT,
	clienteid INT REFERENCES cliente(id)
);

CREATE TABLE endereco (
	id SERIAL PRIMARY KEY,
	rua VARCHAR(100) NOT NULL,
	numero INT NOT NULL,
	complemento VARCHAR(100),
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	uf VARCHAR(2) NOT NULL,
	clienteid INT REFERENCES cliente(id)
);

CREATE TABLE pedido (
	id SERIAL PRIMARY KEY,
	dataehorapedido TIMESTAMP NOT NULL,
	clienteid INT REFERENCES cliente(id)
);

CREATE TABLE categoria (
	id SERIAL PRIMARY KEY,
	nomecategoria VARCHAR(100) NOT NULL,
	descricaocategoria VARCHAR(100) NOT NULL
);

CREATE TABLE produto (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
    datafabricacao DATE NOT NULL,
    valorunitario DECIMAL(10,2) NOT NULL,
    categoriaid INT REFERENCES categoria(id)
);

CREATE TABLE pedidoitem (
	quantidade INT NOT NULL CHECK (quantidade > 0),
    pedidoid INT REFERENCES pedido (id),
    produtoid INT REFERENCES produto (id),
	PRIMARY KEY (pedidoid, produtoid)
);

CREATE TABLE funcionario (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf BIGINT NOT NULL
);

CREATE TABLE estoque (
	id SERIAL PRIMARY KEY,
    quantidadeestoque INT NOT NULL,
    produtoid INT REFERENCES produto(id),
    funcionarioid INT REFERENCES funcionario(id)
);

--4. SQL de inserção de dados nas tabelas (pelo menos 5 registros em cada uma)
INSERT INTO cliente(usuario, nome, sobrenome, email, cpfcnpj, datanascimento)
	VALUES ('Maira Castro', 'Maira', 'Castro', 'mairalocastro@gmail.com', 11111998888, '1986-03-31'),
           ('Maria Paula', 'Maria', 'Paula', 'maria@gmail.com', 22233333333, '1981-10-03'),
		   ('Gabriel Guedes', 'Gabriel', 'Guedes', 'gabrielguedes@gmail.com', 14933333998, '1986-10-03'),
		   ('Hiago Carvalho', 'Hiago', 'Carvalho', 'hiagocarvalho@gmail.com', 24444488998888, '1990-02-01'),
		   ('Luciana Delfino', 'Luciana', 'Delfino', 'lucianadelfino@gmail.com', 55555488998888, '1990-02-17');

INSERT INTO telefones (telefone1, telefone2,telefone3, clienteid)
	VALUES (2125459687, 21994782564, 21998567412, 1),
		   (2121215474, 2199999999, 21998341521, 2),
		   (2422115123, 2499999888, 24992662311, 3),
		   (1131459998, 1184968452, 11996826211, 4),
		   (2144252396, 2122556236, 2141487432, 5);
		 
INSERT INTO endereco (rua, numero, complemento, bairro, cidade, uf, clienteid) 
	VALUES ('Rua Teresa',300,'Apto 101','Centro','Petrópolis','RJ', 1),
		   ('Av. Brasil',1000,'Apto 101','Centro','Resende','RJ', 2),
		   ('Av. Alberto Braune',200,'Loja 5','Centro','Nova Friburgo','RJ', 3),
		   ('Av. Paulista',1000,'Apto 15','Bela Vista','São Paulo','SP', 4),
		   ('Rua Prefeito Sebastião Teixeira', 50, 'Loja 105','Várzea','Teresópolis','RJ', 5);
	
INSERT INTO categoria (nomecategoria, descricaocategoria) 
	VALUES ('Eletrônicos', 'Produtos Eletrônicos Diversos'),
		   ('Eletrodomesticos', 'Produtos Eletrodomesticos Diversos'),
		   ('Celulares', 'Celulares Grandes Marcas'),
		   ('Papelaria', 'Produtos de Papelaria Diversos'),
	   	   ('Roupas', 'Roupas Diversas');
		   
INSERT INTO produto (nome, descricao, datafabricacao, valorunitario, categoriaid)
	VALUES ('Geladeira', 'Duas Portas', '2020-10-10', 1500, 2),
		   ('Iphone', 'Pro Max', '2023-01-06', 7000, 3),
		   ('Radio', 'AM-FM', '1996-01-06', 500, 1),
		   ('Caneta', 'Marca Bic', '1990-06-23', 2, 4),
		   ('Casaco', 'Moletom', '2023-07-22', 67, 5),
		   ('Calça', 'Moletom', '2023-07-23', 60, 5);

INSERT INTO funcionario(nome,cpf)
	VALUES ('João', 24065300002),
		   ('Marcos', 59237154062),
		   ('Allan', 98882137090),
		   ('Eduardo', 77067777070),
		   ('Henrique', 42785505026);

INSERT INTO estoque (quantidadeestoque, produtoid, funcionarioid)
	VALUES (7, 1, 1),
		   (16, 5, 2),
		   (9, 3, 4),
		   (4, 4, 3),
		   (18, 2, 5),
		   (20, 6, 3);

INSERT INTO pedido (dataehorapedido, clienteid)
	VALUES ('2023-08-19 20:23:10', 1),
			('2023-08-20 13:30:27', 2),
			('2023-08-21 17:28:08', 3),
			('2023-08-22 16:03:57', 4),
			('2023-08-23 07:46:33', 5);

INSERT INTO pedidoitem (quantidade, pedidoid, produtoid)
	VALUES (3, 1, 4),
		   (10, 2, 5),
		   (6, 3, 3),
		   (7, 4, 2),
		   (4, 5, 1),
		   (2, 1, 6);
	
SELECT * FROM telefones;
SELECT * FROM endereco;
SELECT * FROM cliente;
SELECT * FROM categoria;
SELECT * FROM produto;
SELECT * FROM estoque;
SELECT * FROM funcionario;
SELECT * FROM pedido;
SELECT * FROM pedidoitem;

--5. Um comando SQL de atualização em algum registro em uma tabela
UPDATE pedidoitem     
	SET quantidade = 4 
	WHERE pedidoid = 1 
	AND produtoid = 4;
	
--6. Um comando SQL de exclusão de algum registro em uma tabela
DELETE FROM pedidoitem 
	WHERE pedidoid = 2
	
--7. 5 SQLs de consulta

--A. JOIN'S
SELECT 
	c.nomecategoria AS "Categoria", 
	p.nome AS "Nome do Produto"
	FROM categoria c 
	INNER JOIN produto p ON c.id = p.categoriaid
	
SELECT c.nome AS "Nome do Cliente", 
	p.id AS "Id do Pedido"
	FROM cliente c
	LEFT JOIN pedido p ON c.id = p.clienteid
	
--B. COUNT + GROUP BY
SELECT c.nomecategoria AS "Categoria", 
	COUNT(p.id) AS "Quantidade de Produtos"
	FROM categoria c
	LEFT JOIN produto p ON c.id = p.categoriaid
	GROUP BY c.nomecategoria;

--C. NOTAS FISCAIS
SELECT pe.id AS "Id do Pedido",
	   pe.dataehorapedido AS "Data e Hora do Pedido",
       CONCAT(c.nome, ' ', c.sobrenome) AS "Nome do Cliente",
	   c.cpfcnpj AS "CPF/CNPJ",
	   c.email "Email",
	   t.telefone1 AS "Telefone",
	   CONCAT(e.rua, ', ',e.numero, ', ',e.complemento, ', ',e.bairro, ', ',e.cidade, '-',e.uf) AS "Endereço do Cliente",
       p.nome AS "Nome dos produtos",
       pi.quantidade AS "Quantidade",
       p.valorunitario AS "Valor Un.",
       (pi.quantidade * p.valorunitario) AS "Sub Total",
	   total_pedido.total AS "Total"
	FROM pedido pe
	JOIN cliente c ON pe.clienteid = c.id
	JOIN pedidoitem pi ON pe.id = pi.pedidoid
	JOIN produto p ON pi.produtoid = p.id
	JOIN endereco e ON e.clienteid = c.id
	JOIN telefones AS t ON t.clienteid = c.id
	JOIN (SELECT pedidoid, SUM(quantidade * valorunitario) AS total
    FROM pedidoitem pi
    JOIN produto pr ON pi.produtoid = pr.id
    GROUP BY pedidoid) AS total_pedido ON pe.id = total_pedido.pedidoid
	WHERE pe.id = 1;

SELECT pe.id AS "Id do Pedido",
	   pe.dataehorapedido AS "Data e Hora do Pedido",
       CONCAT(c.nome, ' ', c.sobrenome) AS "Nome do Cliente",
	   c.cpfcnpj AS "CPF/CNPJ",
	   c.email "Email",
	   t.telefone1 AS "Telefone",
	   CONCAT(e.rua, ', ',e.numero, ', ',e.complemento, ', ',e.bairro, ', ',e.cidade, '-',e.uf) AS "Endereço do Cliente",
       p.nome AS "Nome dos produtos",
       pi.quantidade AS "Quantidade",
       p.valorunitario AS "Valor Un.",
       (pi.quantidade * p.valorunitario) AS "Sub Total",
	   total_pedido.total AS "Total"
	FROM pedido pe
	JOIN cliente c ON pe.clienteid = c.id
	JOIN pedidoitem pi ON pe.id = pi.pedidoid
	JOIN produto p ON pi.produtoid = p.id
	JOIN endereco e ON e.clienteid = c.id
	JOIN telefones AS t ON t.clienteid = c.id
	JOIN (SELECT pedidoid, SUM(quantidade * valorunitario) AS total
    FROM pedidoitem pi
    JOIN produto pr ON pi.produtoid = pr.id
    GROUP BY pedidoid) AS total_pedido ON pe.id = total_pedido.pedidoid
	WHERE pe.id = 3;