--criando a tb_clientes
--restrição:
--pk aplicada a coluna "rg_clente"

Create Table tb_clientes(
  rg_cliente  varchar(15),
  nm_cliente varchar(60),
  dt_nasc    date,

constraint pk_tb_clientes_rg primary key(rg_cliente));

--criando a tb_bibliotecaria
--restrição
--pk aplicada a coluna rg_bibliotecaria

Create Table tb_bilbiotecarias(
  rg_bilbiotecaria    varchar(15),
  nm_bibliotecaria    varchar(60),
  dt_nasc             date,
  constraint pk_tb_bilbiotecarias_rg_bibl primary key(rg_bibliotecaria));

---tb_livros receberá 2FKs
create table tb_livros(
  codigo integer,
  ds_livro varchar(25),
  rg_cliente   varchar(15),
  dt_devolucao    date,
  rg_bilbiotecaria    varchar(15),

constraint pk_tb_livros_codigo primary key(codigo),
  constraint fk_tb_livros_rg_cli foreign key(rg_cliente
      references tb_clientes(rg_cliente,
  constraint fk_tb_livros_rg_bibl foreig key(rg_bibliotecaria)
      references tb_bibliotecarias(rg_bibliotecaria));

    
