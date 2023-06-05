use TrabModulo02;

insert into pessoa
select distinct cod_pessoa, genero, data_nascimento from carga_python;

insert into animal_estimacao (animal)
select distinct animal_estimacao from carga_python order by animal_estimacao;

insert into bebida (bebida)
select distinct bebida_favorita from carga_python order by bebida_favorita;

insert into clima (clima)
select distinct clima from carga_python order by clima;

insert into hobbie (hobbie)
select distinct hobbies from carga_python order by hobbies;

insert into pesquisa (
	data_pesquisa,
    cod_pessoa,
    cod_animal_estimacao,
    cod_bebida,
    cod_clima,
    cod_hobbie
)
select 
	cpy.data_coleta,
	cpy.cod_pessoa,
    aes.cod_animal_estimacao,
    beb.cod_bebida,
    cli.cod_clima,
    hob.cod_hobbie
from 
	carga_python as cpy
inner join
	animal_estimacao as aes on
		aes.animal = cpy.animal_estimacao
inner join
	bebida as beb on 
		beb.bebida = cpy.bebida_favorita
inner join
	clima as cli on 
		cli.clima = cpy.clima
inner join
	hobbie as hob on 
		hob.hobbie = cpy.hobbies