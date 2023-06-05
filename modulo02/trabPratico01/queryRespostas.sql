/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 03: Qual é o hobbie de maior preferência entre o público feminino?
	Resp: Escutar música (103).
/* ------------------------------------------------------------------------------------------------------------------ */
select 
	hob.hobbie,
    count(*) as qtde
from pesquisa as pesq
inner join
	pessoa as pes on 
		pes.cod_pessoa = pesq.cod_pessoa
inner join
	hobbie as hob on 
		hob.cod_hobbie = pesq.cod_hobbie
where
	pes.genero = 'Feminino'
group by
	hob.hobbie
order by count(*) desc;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 04: Qual é o segundo hobbie de preferência entre as mulheres que gostam de cachorro?
	Resp: Dormir (21).
/* ------------------------------------------------------------------------------------------------------------------ */
select 
	hob.hobbie,
    count(*) as qtde
from pesquisa as pesq
inner join
	pessoa as pes on 
		pes.cod_pessoa = pesq.cod_pessoa
inner join
	hobbie as hob on 
		hob.cod_hobbie = pesq.cod_hobbie
where
	pes.genero = 'Feminino'
    and pesq.cod_animal_estimacao = 1 -- (cachorro)
group by
	hob.hobbie
order by count(*) desc;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 05: Qual a bebida favorita entre as mulheres e os homens?
	Resp: Cerveja (138) para as mulheres e café (258) para os homens.
/* ------------------------------------------------------------------------------------------------------------------ */
select 
	pes.genero,
    beb.bebida,
    count(*)
from pesquisa as pesq
inner join
	pessoa as pes on 
		pes.cod_pessoa = pesq.cod_pessoa
inner join
	bebida as beb on 
		beb.cod_bebida = pesq.cod_bebida
group by
	pes.genero,
    beb.bebida
order by 
	pes.genero,
	count(*) desc;   

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 06: Qual a média de idade dos homens que gostam de chá e clima frio?
	Resposta: 45.2.
/* ------------------------------------------------------------------------------------------------------------------ */
select round(AVG(idade), 1) from
(
	select 
		data_nascimento,
		now() as data_atual,
		timestampdiff(YEAR, data_nascimento, now()) as idade
	from pesquisa as pesq
	inner join
		pessoa as pes on 
			pes.cod_pessoa = pesq.cod_pessoa
	where
		pes.genero = 'Masculino'
        and cod_bebida = 4 -- (chá)
        and pesq.cod_clima = 1 -- (frio)        
) as tb;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 07: Quantas pessoas tem como hobbie pintar quadros e qual a sua média de idade respectivamente?
	Resposta: 260 e 47.2.
/* ------------------------------------------------------------------------------------------------------------------ */
select count(*), round(AVG(idade), 1) from
(
	select
		data_nascimento,
		now() as data_atual,
		timestampdiff(YEAR, data_nascimento, now()) as idade
	from 
		pesquisa as pesq
	inner join
		pessoa as pes on
			pes.cod_pessoa = pesq.cod_pessoa
	where
		pesq.cod_hobbie = 7 -- (Pintar quadros)
) as tb;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 09: Qual é a idade da pessoa mais velha e qual é o animal de maior preferência entre esse grupo?
	Resposta: 73 e tartaruga.
/* ------------------------------------------------------------------------------------------------------------------ */

-- Maior idade (73)
select max(timestampdiff(YEAR, data_nascimento, now())) as idade from pessoa;

-- Qual animal de estimação de maior preferência deste grupo
select
	aes.animal,
    count(*)
from
	pesquisa as pesq
inner join
	animal_estimacao as aes on 
		aes.cod_animal_estimacao = pesq.cod_animal_estimacao
where
	pesq.cod_pessoa in
    (
		select cod_pessoa from pessoa
		where
			timestampdiff(YEAR, data_nascimento, now()) = (select max(timestampdiff(YEAR, data_nascimento, now())) as idade from pessoa)
    )
group by
	aes.animal
order by count(*) desc;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 10: Qual é o animal de estimação de maior preferência entre as mulheres e qual a quantidade de mulheres nesse grupo?
	Resposta: Gato e 279 mulheres.
/* ------------------------------------------------------------------------------------------------------------------ */
select
	aes.animal,
    count(*) as qtde
from
	pesquisa as pesq
inner join
	pessoa as pes on
		pes.cod_pessoa = pesq.cod_pessoa
inner join
	animal_estimacao as aes on 
		aes.cod_animal_estimacao = pesq.cod_animal_estimacao
where
	pes.genero = 'Feminino'
group by
	aes.animal
order by count(*) desc;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 11: Quantas pessoas que gostam do clima quente?
	Resposta: 693.
/* ------------------------------------------------------------------------------------------------------------------ */
select count(*) from pesquisa where cod_clima = 3;

/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 13: Qual a quantidade de pessoas que gostam de tempo frio e que gostam de escrever?
	Resposta: 86.
/* ------------------------------------------------------------------------------------------------------------------ */
select count(*) as qtde
from
	pesquisa as pesq
where
	pesq.cod_clima = 1 -- (frio)
    and pesq.cod_hobbie = 4; -- (Escrever)
    
/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 15: Qual é a média de idade para todos os participantes da pesquisa?
	Resposta: 47.8.
/* ------------------------------------------------------------------------------------------------------------------ */
select round(AVG(idade), 1) from
(
	select 
		data_nascimento,
		now() as data_atual,
		timestampdiff(YEAR, data_nascimento, now()) as idade
	from pesquisa as pesq
	inner join
		pessoa as pes on 
			pes.cod_pessoa = pesq.cod_pessoa
) as tb;
