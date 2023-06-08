/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 01: Qual o país que está em segundo lugar no ranking da média geral de vitórias? (independente do jogo)
	Resp: Argentina (25,90).
/* ------------------------------------------------------------------------------------------------------------------ */
select
	nome_pais,
    round((soma_vitorias / qtde), 2) as media
from
	(
		select
			pai.nome_pais,
			sum(jga.num_vitorias) as soma_vitorias,
			count(*) as qtde
		from
			jogador as jga
		inner join
			pais as pai on 
				pai.cod_pais = jga.cod_pais
		group by
			pai.nome_pais
    ) as tb
order by
	round((soma_vitorias / qtde), 2) desc;
    
/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 02: Qual é a soma de derrotas do Brasil no jogo da Dama?
	Resp: 580.
/* ------------------------------------------------------------------------------------------------------------------ */
select
	sum(num_derrotas)
from
	jogador as jga
where
	jga.cod_jogo = 1 -- (Dama)
    and jga.cod_pais = 2; -- (Brasil)
    
/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 03: Qual é o jogo preferido entre o público masculino?
	Resp: Jogo da velha
/* ------------------------------------------------------------------------------------------------------------------ */
select
	jog.nome_jogo,
    count(*) as qtde
from
	jogador as jga
inner join
	jogo as jog on 
		jog.cod_jogo = jga.cod_jogo
where
	jga.genero = 'Masculino'
group by
	jog.nome_jogo
order by
	count(*) desc;
    
/* ------------------------------------------------------------------------------------------------------------------
	Pergunta 05: Qual o jogo que possui o maior número de partidas?
	Resp: Xadrez (8.178)
/* ------------------------------------------------------------------------------------------------------------------ */
select
	jog.nome_jogo,
    sum(jga.total_partidas) as total_partidas
from
	jogador as jga
inner join
	jogo as jog on 
		jog.cod_jogo = jga.cod_jogo
group by
	jog.nome_jogo
order by
	sum(jga.total_partidas) desc;

