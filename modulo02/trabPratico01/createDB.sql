create database TrabModulo02;
use TrabModulo02;

create table animal_estimacao(
	cod_animal_estimacao	int not null auto_increment,
    animal					varchar(45) not null,
    primary key(cod_animal_estimacao)
);

create table bebida(
	cod_bebida	int not null auto_increment,
    bebida		varchar(45) not null,
    primary key(cod_bebida)
);

create table pessoa(
	cod_pessoa		int not null auto_increment,
    genero			varchar(45) not null,
    data_nascimento	date not null,
    primary key(cod_pessoa)
);

create table hobbie(
	cod_hobbie	int not null auto_increment,
    hobbie		varchar(45) not null,
    primary key(cod_hobbie)
);

create table clima(
	cod_clima	int not null auto_increment,
    clima		varchar(45) not null,
    primary key(cod_clima)
);

create table pesquisa(
	cod_pesquisa			int not null auto_increment,
    data_pesquisa			date not null,
    cod_pessoa				int not null,
    cod_animal_estimacao	int not null,
    cod_bebida				int not null,
    cod_hobbie				int not null,
    cod_clima				int not null,
    primary key(cod_pesquisa),
    constraint fk_pessoa foreign key(cod_pessoa) references pessoa(cod_pessoa),
    constraint fk_animal_estimacao foreign key(cod_animal_estimacao) references animal_estimacao(cod_animal_estimacao),
    constraint fk_bebida foreign key(cod_bebida) references bebida(cod_bebida),
    constraint fk_hobbie foreign key(cod_hobbie) references hobbie(cod_hobbie),
    constraint fk_clima foreign key(cod_clima) references clima(cod_clima)
);

