CREATE DATABASE db_rpgEStore
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE	utf8mb4_general_ci;

CREATE TABLE produtos (
	id BIGINT auto_increment NOT NULL,
    nome VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    descrição TEXT,
    preço DECIMAL(6,2) NOT NULL,
    quantidade INT,
    primary key (id)
) DEFAULT CHARSET utf8mb4;

INSERT INTO produtos VALUES (DEFAULT, 'Gelo seco 300g', 'Diversos', 'Ideal para trazer mais drama as suas aventuras, com poções ou cenas dramáticas','15.00','10'),
(DEFAULT, 'Fantasia de Mago cores variadas', 'Fantasias', 'Um kit de fantasia de cor à sua escolha, que acompanha cetro, chapéu e capa, ambos feitos de tecido poliéster. O cetro possui uma pedra que brilha no escuro combinando com a cor da roupa.','80.00','5'),
(DEFAULT, 'Caneca de Taverna 400ml', 'Utensílios', 'Um lindo copo estilo medieval com temática de taverna feito com madeira de bambu e revestido em verniz','20.00','20'),
(DEFAULT, 'Escudo do Mestre Tiamat', 'Escudos de Mestre', 'Escudo do mestre temático com pinturas e apetrechos inspirados na rainha dos dragões Tiamat','89.90','3'),
(DEFAULT, 'Varinha Harry Potter', 'Diversos', 'Réplica de varinha em tamanho real do Harry Potter, feita com material resistente e com bom acabamento. Ideal para os fãs.','120.00','20');

INSERT INTO produtos VALUES (DEFAULT, 'Escultura Dragão Branco 120cm', 'Esculturas', 'Dragão branco pintado e resistente, feito para decorar sua casa.','860.00','1'),
(DEFAULT, 'Kit Dungeons and Dragons', 'Livros', 'Kit com 8 livros de Dungeons and Dragons, feitos para aprimorar suas aventuras.','600.00','4'),
(DEFAULT, 'Escultura de Personagem tamanho grande', 'Esculturas', 'Uma escultura de um personagem a escolha do cliente feito e montado em nossa impressora 3d, até 200cm','550.00','10');

SELECT * FROM produtos WHERE preço < 500;
SELECT * FROM produtos WHERE preço > 500;

UPDATE produtos SET quantidade = 4 WHERE id = 2;