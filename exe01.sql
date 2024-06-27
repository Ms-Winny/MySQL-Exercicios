CREATE DATABASE rh
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

CREATE TABLE colaboradores (
	id BIGINT auto_increment not null,
    nome VARCHAR(50),
    cpf VARCHAR(11),
    função VARCHAR(50),
    salário DECIMAL (7,2),
    primary key (id)
) DEFAULT CHARSET utf8mb4;

INSERT INTO colaboradores VALUES (DEFAULT,'Weida Viana','50841525889','Designer de Personagens','4000.00'),
(DEFAULT,'Ana Silva','97424483154','Desenvolvedora Sênior','5200.00'),
(DEFAULT,'Gabriel Carvalho','77428783154','Desenvolvedor Pleno','8520.00'),
(DEFAULT,'Marinalva Nascimento','36704483870','Roteirista','3800.00'),
(DEFAULT,'Joaquim Andrade','22154976804','Desenvolvedor Júnior','2700.00');

UPDATE colaboradores SET salário = '1500.00' WHERE função = 'Desenvolvedor Júnior';

SELECT * FROM colaboradores WHERE salário > 2000.00;
SELECT * FROM colaboradores WHERE salário < 2000.00;

UPDATE colaboradores SET salário = '1800.00' WHERE função = 'Roteirista';