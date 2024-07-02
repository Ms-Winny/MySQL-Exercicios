CREATE DATABASE db_generation_game_online;

-- Criando a tabela de raças
CREATE TABLE tb_raca(
 id BIGINT not null PRIMARY KEY auto_increment,
 nome VARCHAR (50) NOT NULL,
 habilidaderacial VARCHAR (255) NOT NULL
);

-- Criando a tabela de classes 
CREATE TABLE tb_classe(
 id BIGINT not null PRIMARY KEY auto_increment,
 nome VARCHAR (50) NOT NULL,
 habilidade VARCHAR (255) NOT NULL
);

-- Adicionando descrição nas tabelas classe e raça
ALTER TABLE tb_classe add descrição TEXT AFTER nome;
ALTER TABLE tb_raca add descrição TEXT AFTER nome;

-- Testando formas de alterar nomes de colunas
# ALTER TABLE tb_classe change habilidaderacial habilidadee VARCHAR(255);
# ALTER TABLE tb_classe rename column habilidadee to habilidade;

-- Criando a tabela principal
CREATE TABLE tb_personagens (
	id BIGINT auto_increment NOT NULL primary key,
    nome VARCHAR(50) NOT NULL,
	exp BIGINT NOT NULL default "0",
    nível INT NOT NULL default "1",
    id_classe BIGINT,
    foreign key (id_classe) references tb_classe (id),
    id_raca BIGINT,
    foreign key (id_raca) references tb_raca (id)
);

-- Inserindo classes
INSERT INTO tb_classe VALUES (DEFAULT, 'Druida', 'O druida é um guardião da natureza, mestre em manipular forças naturais e em se comunicar com animais e plantas. Utilizando magias derivadas do poder da terra, ele protege o equilíbrio do ecossistema e pode assumir formas animais, tornando-se um combatente versátil e adaptável. Em harmonia com o mundo selvagem, o druida é um aliado formidável tanto em combate quanto em exploração.', 'Se transformar em animal'),
(DEFAULT,'Ladino', 'O ladino é um mestre da furtividade e da astúcia, especializado em emboscadas e golpes precisos. Expert em desarmar armadilhas, abrir fechaduras e agir nas sombras, ele usa sua agilidade e inteligência para superar obstáculos e adversários. Seja como um espião, assassino ou ladrão, o ladino é um combatente versátil que aproveita cada oportunidade para virar a maré a seu favor.', 'Ficar invisível'),
(DEFAULT,'Clérigo','O clérigo é um devoto fervoroso de uma divindade, canalizando o poder divino para curar aliados e combater o mal. Com uma combinação de magia sagrada e habilidades de combate, ele protege seus companheiros e exorciza ameaças sobrenaturais. O clérigo é um pilar de suporte e fé no campo de batalha, capaz de restaurar vidas e trazer esperança mesmo nas situações mais desesperadoras.','Exorcisar criaturas sobrenaturais'),
(DEFAULT,'Mago','O mago é um estudioso arcano, dedicado ao domínio das artes mágicas através de intenso estudo e prática. Capaz de conjurar poderosos feitiços que variam de destrutivas explosões de energia a complexas ilusões e encantamentos, ele manipula as forças místicas para moldar a realidade. Com um vasto repertório de magias à sua disposição, o mago é uma figura formidável, capaz de enfrentar qualquer desafio com sabedoria e poder arcano.','Conjurar magias'),
(DEFAULT,'Guerreiro','O guerreiro é um combatente excepcional, treinado em diversas formas de combate corpo a corpo e com armas. Com uma combinação de força, habilidade e estratégia, ele enfrenta seus inimigos de frente, resistindo a golpes e desferindo ataques devastadores. Versátil no uso de armaduras e armas, o guerreiro é a linha de frente em qualquer batalha, protegendo seus aliados e esmagando adversários com determinação inabalável.','Combate com vários tipos de armas'),
(DEFAULT,'Bruxo','O bruxo é um conjurador que obtém seus poderes de pactos com entidades sobrenaturais, como demônios, fadas ou outros seres misteriosos. Manipulando energias arcanas concedidas por seus patronos, ele lança magias poderosas e imprevisíveis. O bruxo é um mestre de feitiços únicos e habilidades sombrias, frequentemente explorando conhecimentos proibidos para alcançar seus objetivos. Seu vínculo com forças além da compreensão comum o torna um aliado intrigante e um oponente temível.','Aplicar maldições e encantamentos através de seu pacto');

-- Inserindo algumas raças
INSERT INTO tb_raca VALUES (DEFAULT, 'Humano','Os humanos são versáteis e adaptáveis, conhecidos por sua determinação e capacidade de se sobressair em diversas áreas. Ambiciosos e inovadores, ajustam-se facilmente a diferentes ambientes. Com uma vasta gama de talentos, os humanos prosperam em quase qualquer circunstância.','+1 em todos os atributos'),
(DEFAULT, 'Elfo','Os elfos são seres elegantes e graciosos, conhecidos por sua longevidade, habilidades naturais e conexão com a magia.','Vantagem contra serem enfeitiçados'),
(DEFAULT, 'Anão','Anões são robustos e resilientes, conhecidos por sua resistência, habilidade em trabalhar com metais e por sua cultura profundamente ligada à terra.','Resistência contra veneno e resistência a dano venenoso'),
(DEFAULT, 'Orc','Orcs são guerreiros ferozes e implacáveis, conhecidos por sua força física e determinação em batalha, muitas vezes estereotipados como bárbaros, mas também possuem uma cultura própria profundamente ligada à honra e tradição.','uma vez por dia podem entrar em furia e ganhar resistência a todos os danos de armas por um minuto'),
(DEFAULT, 'Tiefling','Tieflings são descendentes de humanos com traços demoníacos, marcados por sua aparência distinta e habilidades mágicas infernais.','Possuem resistência a dano de fogo.');

-- Inserindo os personagens
INSERT INTO tb_personagens VALUES (DEFAULT, 'Eldrin Estrelaverde','4500','5','2','2'),
(DEFAULT, 'Thrain Pedraforte','3200','4','3','3'),
(DEFAULT, 'Lyra Sanguebravo','6000','6','4','1'),
(DEFAULT, 'Grom Grumosh','3800','4','5','4'),
(DEFAULT, 'Lilith Nocturna','4200','5','6','5'),
(DEFAULT, 'Aelar Folhaalta','2800','3','1','2'),
(DEFAULT, 'Dain Barbapétrea','3400','4','5','3'),
(DEFAULT, 'Serafina Estrela da Manhã','4800','5','3','2');

-- Renomeando as colunas para ficar com uma visualização mais fácil
ALTER TABLE tb_classe rename column nome to classe;
ALTER TABLE tb_raca rename column nome to raca;

-- Adicionando poder de ataque porque eu não sabia que era pra ter
ALTER TABLE tb_personagens ADD column atk BIGINT after nível;
UPDATE tb_personagens SET atk = 3000 WHERE id = 1;
UPDATE tb_personagens SET atk = 1200 WHERE id = 2;
UPDATE tb_personagens SET atk = 7500 WHERE id = 3;
UPDATE tb_personagens SET atk = 4800 WHERE id = 4;
UPDATE tb_personagens SET atk = 3450 WHERE id = 5;
UPDATE tb_personagens SET atk = 700 WHERE id = 6;
UPDATE tb_personagens SET atk = 2900 WHERE id = 7;
UPDATE tb_personagens SET atk = 1000 WHERE id = 8;

-- Adicionando poder de defesa porque eu também não sabia que era pra ter
ALTER TABLE tb_personagens ADD COLUMN def BIGINT AFTER atk;
UPDATE tb_personagens
SET def = CASE id
           WHEN 1 THEN 1500
           WHEN 2 THEN 3200
           WHEN 3 THEN 2000
           WHEN 4 THEN 700
           WHEN 5 THEN 7400
           WHEN 6 THEN 6000
           WHEN 7 THEN 1850
           WHEN 8 THEN 3000
           ELSE NULL -- Adicione um valor padrão caso algum ID não seja encontrado
           END;
# O dois códigos acima mostram duas formas diferentes de dar update em uma tabela


-- Retornando personagens cujo ataque (atk) é maior que 2000 conforme o exercício
SELECT * FROM tb_personagens WHERE atk > 2000;

-- Retornando perosnagens cuja defesa (def) está entre 1000 e 2000 conforme o exercício
SELECT * FROM tb_personagens WHERE def BETWEEN 1000 and 2000;

-- Retornando personagens que possuam a letra C no nome conforme o exercício
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- Retornando de dados nas três tabelas
SELECT tb_personagens.id, tb_personagens.nome, tb_classe.classe, tb_raca.raca
FROM tb_personagens
INNER JOIN tb_classe ON tb_personagens.id_classe = tb_classe.id
INNER JOIN tb_raca ON tb_personagens.id_raca = tb_raca.id; 

-- Retornando apenas personagens que são elfos
SELECT tb_personagens.id, tb_personagens.nome, tb_classe.classe, tb_raca.raca
FROM tb_personagens
INNER JOIN tb_classe ON tb_personagens.id_classe = tb_classe.id
INNER JOIN tb_raca ON tb_personagens.id_raca = tb_raca.id
WHERE tb_raca.raca = 'Elfo';

-- Retornando apenas personagens que são clérigos conforme o execício
SELECT tb_personagens.id, tb_personagens.nome, tb_classe.classe, tb_raca.raca
FROM tb_personagens
INNER JOIN tb_classe ON tb_personagens.id_classe = tb_classe.id
INNER JOIN tb_raca ON tb_personagens.id_raca = tb_raca.id
WHERE tb_classe.classe = 'Clérigo';

-- Retornando personagens que são clérigos e elfos
SELECT tb_personagens.id, tb_personagens.nome, tb_classe.classe, tb_raca.raca
FROM tb_personagens
INNER JOIN tb_classe ON tb_personagens.id_classe = tb_classe.id
INNER JOIN tb_raca ON tb_personagens.id_raca = tb_raca.id
WHERE tb_classe.classe = 'Clérigo' AND tb_raca.raca = "Elfo";

