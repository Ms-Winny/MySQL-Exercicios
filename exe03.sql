CREATE DATABASE db_escola
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

CREATE TABLE tb_alunos (
id BIGINT auto_increment NOT NULL,
ra INT NOT NULL,
nome VARCHAR(50) NOT NULL,
sala INT NOT NULL,
notafinal DECIMAL(3,1),
primary key (id)
) DEFAULT CHARSET utf8mb4;

INSERT INTO tb_alunos VALUES (DEFAULT, '12236', 'Ana Clara Silva', '4', '8.0'),
(DEFAULT, '57340', 'João Pedro Almeida', '2', '5.0'),
(DEFAULT, '20661', 'Maria Fernanda Oliveira', '4', '3.0'),
(DEFAULT, '41509', 'Pedro Henrique Santos', '1', '7.5'),
(DEFAULT, '13989', 'Beatriz Costa Lima', '1', '10.0'),
(DEFAULT, '26549', 'Lucas Gabriel Souza', '3', '4.5'),
(DEFAULT, '57816', 'Gabriel Martins Souza', '2', '6.0'),
(DEFAULT, '50158', 'Camila Rodrigues Ferreira', '3', '9.5');

SELECT * FROM tb_alunos WHERE notafinal > 7;
SELECT * FROM tb_alunos WHERE notafinal < 7;

UPDATE tb_alunos SET sala = 4 WHERE notafinal < 5;
UPDATE tb_alunos SET sala = 5 WHERE notafinal >= 8;