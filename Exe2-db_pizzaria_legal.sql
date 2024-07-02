# Criando a database
CREATE DATABASE db_pizzaria_legal
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

# Criando a tabela com as categorias
CREATE TABLE tb_categorias (
	id BIGINT auto_increment not null,
	tipoPizza VARCHAR(50) not null,
    descriçãoTipo VARCHAR(255) not null,
	primary key (id)
) DEFAULT CHARSET utf8mb4;

# Criando a tabela com as pizzas
CREATE TABLE tb_pizzas (
	id BIGINT auto_increment not null primary key,
	nomePizza VARCHAR(50) not null,
    valorPizza DECIMAL(5,2) not null,
    descriçãoPizza VARCHAR (255) not null,
    tipo BIGINT,
    foreign key (tipo) references tb_categorias (id)
) DEFAULT CHARSET utf8mb4;

# Inserindo resgistros de categorias
INSERT INTO tb_categorias VALUES (DEFAULT, 'Salgada padrão', 'Uma pizza com recheios salgados'),
(DEFAULT, 'Doce padrão', 'Uma pizza com recheios doces'),
(DEFAULT, 'Vegana', 'Uma pizza vegana que pode ser doce ou salgada'),
(DEFAULT, 'Vegetariana', 'Uma pizza vegetariana que pode ser doce ou salgada'),
(DEFAULT, 'Especial da casa', 'Pizza elaborada exclusivamente pelos donos da loja');

# Inserindo registros de pizzas
INSERT INTO tb_pizzas VALUES (DEFAULT, 'Pepperoni','49.90','Pizza clássica com molho de tomate, queijo muçarela e generosas fatias de pepperoni.','1'),
(DEFAULT, 'Romeu e Julieta','35.90','Pizza com uma base de goiabada, queijo canastra e pedaços de goiaba.','2'),
(DEFAULT, 'Abobrinha e cogumelos','69.90','Pizza vegana com molho de tomate, queijo vegano, abobrinha, pimentão, cebola, cogumelos e azeitonas.','3'),
(DEFAULT, 'Vegetariana Simples','39.90','Pizza com molho de tomate, queijo muçarela, abobrinha, pimentão, cebola, cogumelos e azeitonas.','4'),
(DEFAULT, 'Troiana','69.90','Pizza com molho de tomate, queijo muçarela, lombo picado em cubos, requeijão do tipo cautpiry, queijo parmesão e bacon picado pré-assado.','5'),
(DEFAULT, 'Margherita',' 39.90','Pizza tradicional italiana com molho de tomate, queijo muçarela fresca, queijo parmesão e folhas de manjericão fresco.','1'),
(DEFAULT, 'Salada de frutas','55.90','Pizza doce com base de creme de baunilha, coberta com uma variedade de frutas frescas como morangos, kiwi, manga e blueberries.','2'),
(DEFAULT, 'Pesto com pinhões','49.90','Pizza vegana com base de molho pesto de manjericão, coberta com tomate cereja cortado ao meio, rúcula fresca e pinhões tostados, finalizada com um fio de azeite de oliva extra virgem.','3');

# Mostrando pizzas com valor maior que 45,00
SELECT * FROM tb_pizzas WHERE valorPizza > 45.00; 

# Mostrando pizzas com valor entre 50,00 e 100,00
SELECT * FROM tb_pizzas WHERE valorPizza between 50.00 AND 100.00;

# Mostrando pizzas que contenham a letra m no nome
SELECT * FROM tb_pizzas WHERE nomePizza LIKE "%m%";

# Mostrando a tabela de pizzas junto com alguns dados da tabela de categorias
SELECT tb_pizzas.id, tb_pizzas.nomePizza, tb_pizzas.valorPizza, tb_categorias.tipoPizza
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.tipo = tb_categorias.id;

# Mostrando apenas pizzas de uma categoria específica
SELECT tb_pizzas.id, tb_pizzas.nomePizza, tb_pizzas.valorPizza, tb_categorias.tipoPizza, tb_categorias.descriçãoTipo
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.tipo = tb_categorias.id
WHERE tb_categorias.tipoPizza = 'Salgada padrão';