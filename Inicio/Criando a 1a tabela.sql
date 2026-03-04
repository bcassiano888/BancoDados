--criando a tb_dept
--restrição:
--PK Aplicada a coluna "cod_depto"
CREATE TABLE tb_dept(
cod_dept	INTEGER,
nm_dept		VARCHAR(40),
CONSTRAINT pk_tb_depto_cod_depto PRIMARY KEY(cod_dept)
);
-- como nomear as restrições na table
--sufixo_table_name_column_name
-- exemplo; pk_tb_dept_cod_dept

--consultando a tb_dept
SELECT*
FROM tb_dept;

--realizando uma carga de dados na tb_dept
insert into tb_dept(cod_dept,nm_dept)
values
(1,'Computação'),
(2,'Engenharia'),
(3,'Ciências Médica'),
(4,'Administração')

--criando a tb_disciplina
--restrição:
-- PK aplicada a coluna cod_disciplina
-- FK aplicada a coluna cod_dept
-- NN aplicada  a coluna cod_dept

create table tb_disciplina(
cod_disciplina	integer,
cod_dept 		integer constraint nn_tb_disc_cod_dept not null,
nm_disciplina 	varchar(40),
credito 		integer,
constraint pk_tb_disc_cod_disc primary key(cod_disciplina),
constraint fk_tb_disc_cod_dept foreign key(cod_dept)
	references tb_dept(cod_dept)
);
