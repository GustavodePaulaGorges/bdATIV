-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
create database banco_museu;
use banco_museu;


CREATE TABLE autor (
cod_autor int PRIMARY KEY,
nacionalidade_autor char(3) not null,
nome_autor varchar(80) not null
);

CREATE TABLE salao (
cod_salao int PRIMARY KEY,
num_salao int not null,
andar_museu int not null,
salao varchar(80) not null
);

CREATE TABLE salao_obra (
salao_cod_salao int not null,
obra_cod_obra int not null,
posicao_salao varchar(80) not null,
FOREIGN KEY(salao_cod_salao) REFERENCES salao (cod_salao)
);

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int PRIMARY KEY,
tipo_funcionario varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

CREATE TABLE obra (
cod_obra int PRIMARY KEY,
ano_obra year not null,
titu_obra varchar(80) not null unique,
peso_obra decimal(10,2) null,
material_obra varchar(80) null,
desc_estilo_obra varchar(80) null,
cod_autor int not null,
cod_tipo_obra int not null,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor)
);

CREATE TABLE tipo_obra (
cod_tipo_obra int PRIMARY KEY,
desc_tipo_obra varchar(80) not null
);

CREATE TABLE atividade (
ob_cod_obra int not null,
func_id_funcionario int not null,
hora_entrada time not null,
hora_saida time not null,
data_atividade date not null,
FOREIGN KEY(ob_cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE manutencao (
mnt_obra int PRIMARY KEY,
data_termi_mnt date not null,
custo_mnt decimal(10,2) not null,
data_ini_mnt date not null,
desc_mnt varchar(80) not null,
cod_obra int not null,
func_id_funcionario int not null,
FOREIGN KEY(cod_obra) REFERENCES obra (cod_obra),
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE materia_prima (
cod_mat_prima int PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE manu_mat (
Campo_1 int not null,
Campo_2 int not null,
qtd_mat_mnt varchar(15) not null,
FOREIGN KEY(Campo_1) REFERENCES manutencao (mnt_obra),
FOREIGN KEY(Campo_2) REFERENCES materia_prima (cod_mat_prima)
);

ALTER TABLE salao_obra ADD FOREIGN KEY(obra_cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);


insert into salao(cod_salao, num_salao, andar_museu, salao) 
values 
(61988,594,1,"Salao de Verao"),
(20170,055,1,"Salao de Outono"),
(91374,704,1,"Salao de Primavera"),
(40033,788,1,"Salao de Inverno"),
(77141,282,2,"Salao Brasil"),
(98631,545,2,"Salao Alemanha"),
(15236,802,2,"Salao Italia"),
(15973,489,2,"Salao Japao"),
(93526,682,2,"Salao Estados Unidos"),
(68139,866,2,"Salao Espanha"),
(61769,490,2,"Salao Gra-Bretanha"),
(94168,861,2,"Salao Coreia"),
(95358,602,2,"Salao Suica"),
(67516,471,3,"Salao Suecia"),
(53137,920,3,"Salao Australia"),
(10611,611,3,"Salao Noruega"),
(84200,815,3,"Salao Grecia"),
(97157,057,3,"Salao Roma"),
(71631,104,3,"Salao Russia"),
(43533,588,3,"Salao Mesopotamia");

insert into tipo_funcionario(cod_tipo_funcionario,tipo_funcionario)
values
(01,"Guarda"),
(02,"Restauradores de obras"),
(03,"Operarios de limpeza");

insert into tipo_obra(cod_tipo_obra, desc_tipo_obra)
values
(01,"Pintura"),
(02,"Escultura");

insert into autor(cod_autor, nacionalidade_autor, nome_autor) 
values 
(123723,"BR", "Maria Azevedo Barros"),
(137843,"CN", "Jin Yuan"),
(523153,"JP", "Kentaru Miyura"),
(829123,"BR", "Clovis de Barros"),
(143721,"BR", "Mario Sergio Cortella"),
(153733,"BR", "Gabriel Molo"),
(424723,"BR", "Marco Andre Rojas"),
(123115,"BR", "Ana Vitoria da Silva"),
(213755,"BR", "Maria Rita de Oliveira"),
(133223,"it", "Heron Sapellini"),
(137823,"UK", "Josh Nelson "),
(234834,"US", "Robert King"),
(223374,"US", "Michael Howe"),
(229123,"UK", "Katherine Cunningham"),
(121713,"JP", "Akira Hashimoto"),
(123793,"NO", "Elena Erstad"),
(124723,"SI", "Alda Kiselic"),
(123731,"SE", "Emmi Lundqvist"),
(123623,"PL", "Natasza Wisniewska"),
(175663,"AO", "Gustavo Daybaz"),
(523693,"JP", "Aya Yasaka");

insert into funcionario(id_funcionario, nome_funcionario, salario_funcionario, cpf_funcionario, cod_tipo_funcionario)
values
(01, "Paulo Salles", "1800.00", "70445352086", "01"),
(02, "Sandra Maximoff", "2000.00", "83520296063", "03"),
(03, "Paulo Roberto", "1500.00", "41025545052", "02"),
(04, "Marcia dos Santos", "1800.00", "99954544089", "02"),
(05, "Magali de Souza", "1800.00", "90546161057", "01"),
(06, "Roberto da Silva", "2500.00", "42343594082", "02"),
(07, "Cristian Figueiredo", "1500.00", "18812713076", "03"),
(08, "Tonia Maria Bento", "1800.00", "65133095066", "01"),
(09, "Pamela Vieira", "1800.00", "33381447092", "01"),
(10, "Tadeu Miller", "1000.00", "77711556004", "01"),
(11, "Lizie Maya", "1000.00", "33338446055", "03"),
(12, "Rafaeli Cristine Vasquez", "1800.00", "27772967071", "02"),
(13, "Augusta Klein", "1800.00", "87121721031", "03"),
(14, "Diana Oliveira", "2000.00", "23218901006", "02"),
(15, "Lucas Patricio", "1500.00", "41197049045", "02"),
(16, "Gonzaga Filho", "1500.00", "81708481052", "02"),
(17, "Lisandre Ordelli", "1000.00", "75338230011", "03"),
(18, "Monica Barros", "2300.00", "43813578097", "02"),
(19, "Daniele Davila", "3000.00", "81719385076", "01"),
(20, "Cris Batista", "1900.00", "75210027090", "01");

insert into materia_prima(cod_mat_prima, qtd_est_mat, nome_mat_prima)
values
(01, 30, "Sabao"),
(02, 70, "Cotonete"),
(03, 10, "Tinta a oleo"),
(04, 20, "Massa Tapa-Buraco"),
(05, 20, "Argamassa"),
(06, 30, "Cera"),
(07, 10, "Cola"),
(08, 50, "Tinta"),
(09, 10, "Tinta acrilica"),
(10, 30, "Detergente"),
(11, 40, "Gesso"),
(12, 50, "Marmore"),
(13, 60, "Plastico"),
(14, 40, "Cloro"),
(15, 50, "Algodao"),
(16, 30, "Serragem"),
(17, 20, "Acrilico"),
(18, 20, "Lixa"),
(19, 10, "Verniz"),
(20, 40, "Madeira");

insert into obra (cod_obra, ano_obra, titu_obra, peso_obra, material_obra, desc_estilo_obra, cod_autor, cod_tipo_obra)
values
(01, 1937, "Guernica", NULL, NULL, "Cubismo", 213755, 1),
(02, 1907, "O Beijo", NULL, NULL, "Impressionismo", 137823, 1),
(03, 1948, "Num Five", NULL, NULL, "Expressionismo", 229123, 1),
(04, 1944, "Os Retirantes", NULL, NULL, "Antiquismo", 123731, 1),
(05, 1917, "A Fonte", 120, "Acrilico", NULL, 133223, 2),
(06, 1972, "Impressao Sol Nascente", NULL, NULL, "Impressionismo", 175663, 1),
(07, 1984, "Uma Tarde de Domingo na Ilha de Grande Jatte", NULL, NULL, "Impressionismo", 123623, 1),
(08, 1988, "Doze girassois numa jarra", NULL, NULL, "Abstrato", 143721, 1),
(09, 1929, "A traicao das imagens", NULL, NULL, "Cubismo", 124723, 1),
(10, 1936, "Cafe da manha em pele", 1, "Marmore", NULL, 829123, 2),
(11, 1913, "Formas Unicas de Continuidade no Espaco", 40, "Gesso", NULL, 523153, 2),
(12, 1984, "O nascimento de Venus", NULL, NULL, "Impressionismo", 234834, 1),
(13, 1945, "Impossivel", 3, "Cobre", NULL, 123793, 2),
(14, 1928, "Abaporu", NULL, NULL, "Modernismo", 223374, 1),
(15, 1904, "O Pensador", 102, "Bronze", NULL, 523693, 2),
(16, 1996, "A ultima ceia", NULL, NULL, "Renascentismo", 121713, 1),
(17, 1999, "Pieta", 36, "Marmore", NULL, 123115, 2),
(18, 1945, "Busto de Nefertiti", 63, "Argila", NULL, 137843, 2),
(19, 1912, "Mamam", 308, "Bronze", NULL, 153733, 2),
(20, 1908, "Venus de Willendorf", 1, "calcario oolitico", NULL, 123723, 2);

insert into manutencao (mnt_obra, data_termi_mnt, custo_mnt, data_ini_mnt, desc_mnt, cod_obra, func_id_funcionario)
values
(001, '2022-03-12', 1554, '2023-03-12', "troca do pedestal de madeira", 01, 11),
(002, '2021-01-12', 1337, '2025-06-25', "retoque da pintura", 12, 18),
(003, '2024-06-25', 4590, '2025-07-25', "repintura da parede que a obra se encontra", 14, 18),
(004, '2023-10-22', 1112, '2024-10-22', "troca do pedestal de madeira", 02, 11),
(005, '2024-12-12', 2345, '2025-12-12', "limpeza do domo em que a obra se encontra", 05, 07),
(006, '2024-02-13', 987, '2025-02-13', "retoque da pintura", 07, 03),
(007, '2024-04-17', 1234, '2025-04-17', "revitalizacao da pintura", 09, 04),
(008, '2025-09-18', 5444, '2026-09-18', "limpeza do quadro", 12, 07),
(009, '2024-10-24', 560, '2025-10-24', "repintura da parede que a obra se encontra", 06, 04),
(010, '2023-12-04', 897, '2024-12-04', "limpeza do po na obra", 04, 13),
(011, '2024-05-09', 3459, '2025-05-09', "limpeza do domo em que a obra se encontra", 18, 13),
(012, '2025-08-14', 1564, '2026-08-14', "revitalizacao da pintura", 19, 06),
(013, '2025-06-30', 2435, '2026-06-30', "polimento da obra", 04, 18),
(014, '2026-01-01', 1324, '2027-01-01', "troca do pedestal de madeira", 07, 11),
(015, '2025-11-29', 664, '2026-11-29', "limpeza do po na obra", 16, 17),
(016, '2024-07-04', 998, '2025-07-04', "restauracao da obra", 15, 06),
(017, '2025-03-11', 1144, '2026-03-11', "restauracao da obra", 14, 15),
(018, '2023-11-23', 3658, '2024-11-23', "limpeza do domo em que a obra se encontra", 12, 17),
(019, '2026-04-12', 2234, '2027-04-12', "polimento da obra", 17, 03),
(020, '2026-04-12', 460, '2027-04-12', "revitalizacao da obra", 11, 15);

insert into salao_obra (salao_cod_salao, obra_cod_obra, posicao_salao)
values
(61988, 01, "Parte superior"),
(20170, 02, "Parte esquerda"),
(91374, 03, "Parte central"),
(40033, 04, "Parte inferior"),
(77141, 05, "Parte superior"),
(98631, 06, "Parte inferior"),
(15236, 07, "Parte esquerda"),
(93526, 08, "Parte central"),
(68139, 09, "Parte direita"),
(61769, 10, "Parte superior"),
(94168, 11, "Parte esquerda"),
(95358, 12, "Parte esquerda"),
(67516, 13, "Parte direita"),
(53137, 14, "Parte central"),
(10611, 15, "Parte superior"),
(84200, 16, "Parte direita"),
(97157, 17, "Parte central"),
(71631, 18, "Parte esquerda"),
(43533, 19, "Parte inferior"),
(15973, 20, "Parte direita");

insert into atividade(ob_cod_obra, func_id_funcionario, hora_entrada, hora_saida, data_atividade)
values
(01, 01,  '2021-11-02 13:44:01' , '2021-11-02 14:44:01', '2021-11-02'),
(02, 02 , '2012-12-02 18:02:01' , '2012-12-02 19:02:01', '2012-12-02'),
(03, 03 , '2019-01-02 12:14:01' , '2019-01-02 13:14:01', '2019-01-02'),
(04, 04 , '2001-11-09 02:55:01' , '2001-11-09 03:55:01', '2001-11-09'),
(05, 05 , '2018-04-02 02:48:01' , '2018-04-02 03:48:01', '2018-04-02'),
(06, 06 , '2021-05-02 08:34:01' , '2021-05-02 09:34:01', '2021-05-02'),
(07, 07 , '2019-01-02 06:56:01' , '2019-01-02 07:56:01', '2019-01-02'),
(08, 08 , '2004-05-04 13:14:01' , '2004-05-04 14:14:01', '2004-05-04'),
(09, 09 , '2008-04-02 07:29:01' , '2008-04-02 08:29:01', '2008-04-02'),
(10, 10 , '2010-04-02 15:24:01' , '2010-04-02 17:24:01', '2010-04-02'),
(11, 11 , '2005-04-02 17:04:01' , '2005-04-02 18:04:01', '2005-04-02'),
(12, 12 , '2006-04-02 18:28:01' , '2006-04-02 19:28:01', '2006-04-02'),
(13, 13 , '2000-04-02 13:34:01' , '2000-04-02 14:34:01', '2000-04-02'),
(14, 14 , '2020-04-02 19:35:01' , '2020-04-02 15:35:01', '2020-04-02'),
(15, 15 , '2022-02-02 20:44:01' , '2022-02-02 21:44:01', '2022-02-02'),
(16, 16 , '2022-01-02 09:14:01' , '2022-01-02 10:14:01', '2022-01-02'),
(17, 17 , '2005-04-02 00:01:01' , '2005-04-02 01:01:01', '2005-04-02'),
(18, 18 , '2003-10-02 16:45:01' , '2003-10-02 17:45:01', '2003-10-02'),
(19, 19 , '2001-01-02 23:14:01' , '2001-01-02 00:14:01', '2001-01-02'),
(20, 20 , '2020-01-02 23:14:01' , '2020-01-02 00:14:01', '2020-01-02');

insert into manu_mat(Campo_1, Campo_2, qtd_mat_mnt)
values
(001, 01, 21),
(002, 03, 22),
(001, 06, 15 ),
(002, 09, 05),
(002, 10, 12),
(002, 13, 14),
(001, 16, 18),
(001, 20, 14),
(002, 20, 16),
(001, 16, 10),
(001, 17, 02),
(002, 12, 04),
(002, 09, 06),
(001, 20, 01),
(002, 09, 04),
(001, 03, 05),
(001, 02, 09),
(002, 01, 10),
(002, 11, 11),
(001, 12, 11);






