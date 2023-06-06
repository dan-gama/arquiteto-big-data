create database coletaIGTI;
use coletaIGTI;

create table fabricante (
	cod_fabricante		int not null auto_increment,
    nome_fabricante		varchar(45) not null,
    primary key(cod_fabricante)
);

create table modelo_veiculo (
	cod_modelo			int not null auto_increment,
    descricao_modelo	varchar(45),
    cod_fabricante		int not null,
    primary key(cod_modelo),
    constraint fk_fabricante foreign key(cod_fabricante) references fabricante(cod_fabricante)
);

create table pessoa (
	cod_pessoa		int not null,
    nome			varchar(200),
    genero			varchar(45),
    data_nascimento	date,
    primary key(cod_pessoa)
);

create table venda_veiculo (
	cod_venda			int not null auto_increment,
    data_venda			date,
    valor_venda			decimal(10,2),
    cod_pessoa			int,
    cod_modelo			int,
    primary key(cod_venda),
    constraint fk_pessoa foreign key(cod_pessoa) references pessoa(cod_pessoa),
    constraint fk_modelo_veiculo foreign key(cod_modelo) references modelo_veiculo(cod_modelo)
);

create table stg_venda_veiculo (
	cod_pessoa		int,
    nome			varchar(200),
    genero			varchar(45),
    data_nascimento	date,
    data_compra		date,
    fabricante		varchar(45),
    modelo			varchar(45),
    valor			decimal(10,2)
);