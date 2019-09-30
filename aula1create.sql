use cadastro;
create database ecommerce; 
use ecommerce;
create table categorias(

cod_categoria smallint(5) unsigned not null, 
nome varchar(50) not null,
primary key(cod_categoria) 
);
show tables;
create table marcas(

cod_marcas smallint(5) unsigned  not null primary key,
nome varchar(50) not null
);

create table subcategorias(

	cod_subcategoria smallint(5) unsigned not null,
    nome varchar (50) not null,
    cod_categoria smallint(5) unsigned not null,
    primary key(cod_subcategoria),
    foreign key(cod_categoria) 
    references categorias(cod_categoria)
);

create table formaspagamentos(
	cod_formapagamento smallint(5) unsigned not null,
    entrada tinyint(1) unsigned not null default 0,
    parcelas tinyint(3) unsigned not null, 
    tipo varchar (20) not null,
    primary key(cod_formapagamento)

);
create table clientes (
cpf int(16) unsigned not null primary key,
nome varchar(200) not null,
rg int(16) unsigned not null,
estado_rg char(2) not null,
telefone char(12),
data_nascimento date not null,
email varchar (100) not null,
endereco varchar(200) not null,
bairro varchar(80) not null,
cidade varchar(80) not null,
estado char(2) not null
);

create table produtos(
cod_produto smallint (5) unsigned not null,
nome varchar(100) not null,
preço decimal (8,2) not null, 
cod_marca smallint(5) unsigned not null,
cod_subcategoria smallint(5) unsigned not null,
primary key (cod_produto),
foreign key(cod_marca) references marcas (cod_marca),
foreign key(cod_subcategoria) references 
subcategorias(cod_subcategoria)
);
create table formasprodutos(
	cod_produto smallint(5) unsigned not null,
    cod_formapagamento smallint(5) unsigned not null,
    primary key (cod_produto, cod_formapagamento),
    foreign key(cod_produto) references produtos (cod_produto),
	foreign key(cod_formapagamento) references
    formaspagamentos (cod_formapagamento)
);
create table imagens(
	cod_imagem mediumint(8) unsigned not null,
    arquivo varchar(50) not null,
    cod_produto smallint(5) unsigned not null,
    primary key(cod_produto) references produtos(cod_produto)
);

create table carrinhos(
cod_carrinho int(16) unsigned not null primary key,
cpf int(16) unsigned not null,
total decimal(9,2) not null default 0,
data_hora datetime not null,
foreign key(cpf) references clientes(cpf)
);

create table listascasamentos(
cod_listacasamento mediumint(8) unsigned not null,
cpf int(16) unsigned not null,






);



/*
tinyint 0 a 255
smallint o a 655535
mediumint 8
int 16
bigint 32
tipos de caracteres:
char(4) tipo texto fixo - deixa um espaço branc  0 a 255
varchar(4) tipo texto variado - n deixa espaço em branco 0 a 255
text 0 a 65535
longtext 
*/
