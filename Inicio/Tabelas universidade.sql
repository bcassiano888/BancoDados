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
	)

create table tb_curso(
cod_curso 			integer,
nm_curso 			varchar(40),
constraint pk_tb_curso_cod_curso primary key(cod_curso)
);

create table tb_aluno(
--restrições
--PK ligada a coluna cod_aluno
--FK aplicada a coluna cod_curso
--NN aplicada a coluna cod_curso
cod_aluno 	integer,
nm_aluno 	varchar(60),
cod_curso 	integer constraint nn_tb_aluno_cod_curso not null,
dt_nascimento 	date,
constraint pk_tb_aluno_cod_curso primary key(cod_aluno),
constraint fk_tb_aluno_cod_curso foreign key(cod_curso)
	references tb_curso(cod_curso)
	);
)

create table tb_discplina_aluno(
--restrições
--PK Composta aplicadas as colunas cod_discplina e cod_curso
--FK aplicada a coluna cod_disciplina,
--FK aplicada a cod_curso
cod_disciplina integer,
cod_curso integer,
constraint pk_tb_dc_cod_dc_cod_curso primary key(cod_disciplina,cod_curso),
constraint fk_tb_dc_cod_dc foreign key(cod_disciplina)
	references tb_disciplina(cod_disciplina),
constraint fk_tb_dc_cod_curso foreign key(cod_curso)
	references tb_curso(cod_curso)
	);

--criando a tb_pre_requisito
--	restrições:
--PK composta aplicada as colunas cod_disciplina_liberada 
-- e cod_disciplina_liberadora
--FK  aplicada a coluna cod_disciplina_liberada
--FK aplicada a coluna cod_disciplina_liberadora
create table tb_pre_requisito(
cod_dc_liberada integer,
cod_dc_liberadora integer,
constraint pk_tb_pr_liberada_liberadora
	primary key(cod_dc_liberada,cod_dc_liberadora),
	
constraint fk_tb_pr_liberada foreign key(cod_dc_liberada)
	references tb_disciplina(cod_disciplina),

constraint fk_tb_pr_liberadora foreign key(cod_dc_liberadora)
	references tb_disciplina(cod_disciplina)
	);



