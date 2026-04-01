-- criando a tb_instituicoes
-- restrição:
--pk aplicada a coluna sigla

create table tb_instituicoes(
sigla 	char(3),
nm_instituicao varchar(45),

constraint pk_tb_instituicao_sigla primary key(sigla)
);

-- criando a tb_projetos
-- restrição:
--pk aplicada a coluna nr

create table tb_projetos(
nr 			integer,
ds_projeto  varchar(45),
orcamento   numeric(7,2),
constraint pk_tb_projetos_nr primary key(nr)
);

-- criando a tb_pesquisadores
-- restrição
-- pk aplicada a coluna "rg"

create table tb_pesquisadores(
rg 				varchar(11),
nm_pesquisador  varchar(60),
dt_nasc 		 date,
constraint pk_tb_pesquisadores_rg primary key(rg)
);

-- criando a tb_pesquisas oriunda do relacionamento ternario N:N:N entre
-- as entidades "instituicoes", "projetos" e "pesquisadores"
-- restrições:
--pk composta aplicada as colunas "sigla","nr" e  "rg"
--fk aplicada a coluna "sigla"
--fk aplicada a coluna "nr"
--fk aplicada a coluna "rg"

create table tb_pesquisas(
sigla  	char(3),
nr 		integer,
rg 		varchar(11),
dt_inicio 	date,

constraint pk_tb_pesquisas_sigla_nr_rg primary key(sigla,nr,rg),

constraint fk_tb_pesquisas_sigla foreign key (sigla)
	references tb_instituicoes(sigla),

constraint fk_tb_pesquisas_nr foreign key(nr)
	references tb_projetos(nr),

constraint fk_tb_pesquisas_rg foreign key(rg)
	references tb_pesquisadores(rg)
);

-- criando a tb_produtos
-- restrições:
-- pk aplicada a coluna codigo

create table tb_produtos(
codigo 		integer,
ds_produto 	varchar(45),
preco 		numeric(7,2),
constraint pk_tb_produtos_cod primary key(codigo)
);

-- criando a tb_cidades
-- restrição:
--pk aplicada a coluna codigo

create table tb_cidades(
codigo	integer,
nm_cidade 	varchar(45),
uf			char(2),

constraint pk_tb_cidades_cod primary key(codigo)
);

-- criando a tb_distribuidores
-- restricão:
-- pk aplicada a coluna rg

create table tb_distribuidores(
rg 				varchar(11),
nm_distribuidor varchar(60),
dt_nasc 		date,

constraint pk_tb_distribuidores_rg primary key(rg)
);

-- criando a tb_distribuições 
-- proveniente do relacionamento 1:N:N
-- restrições
-- pk composta aplicada as colunas codproduto e codcidade
-- fk aplicada a coluna cod_produto
-- fk aplicada a coluna cod_cidade
-- fk aplicada a coluna rg

create table tb_distribuicoes(
cod_produto 	integer,
cod_cidade 	 	integer,
rg 				varchar(11),

constraint pk_tb_dist_cod_prod_cod_cid primary key(cod_produto,cod_cidade),

constraint fk_tb_dist_cod_prod foreign key (cod_produto)
	references tb_produtos(codigo),

constraint fk_tb_dist_cod_cid foreign key (cod_cidade)
	references tb_cidades(codigo),

constraint fk_tb_dist_rg foreign key(rg)
	references tb_distribuidores(rg)
);
