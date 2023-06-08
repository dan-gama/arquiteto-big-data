create database desafioModulo02;
use desafioModulo02;

create table pais(
	cod_pais	int not null auto_increment,
    nome_pais	varchar(45) not null,
    primary key(cod_pais)
);

create table jogo(
	cod_jogo	int not null auto_increment,
    nome_jogo	varchar(45) not null,
    primary key(cod_jogo)
);

create table jogador(
	cod_jogador		int not null auto_increment,
    nome_jogador	varchar(45) not null,
    genero			varchar(45) not null,
    data_nascimento	date not null,
    num_vitorias	int not null,
    num_derrotas	int not null,
    total_partidas	int not null,
    cod_pais		int not null,
    cod_jogo		int not null,
    primary key(cod_jogador),
    constraint foreign key(cod_pais) references pais(cod_pais),
    constraint foreign key(cod_jogo) references	jogo(cod_jogo)
);

create table stg_jogador(
	jogador					varchar(45) not null,
    genero					varchar(45) not null,
    data_nascimento			varchar(45) not null,
    jogo					varchar(45) not null,
    pais					varchar(45) not null,
    num_vitorias			int not null,
    num_derrotas			int not null,
    total_partidas			int not null,
    data_nascimento_tratada	date not null
);