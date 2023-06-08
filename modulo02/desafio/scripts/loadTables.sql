insert into jogador(
	nome_jogador,
    genero,
    data_nascimento,
    num_vitorias,
    num_derrotas,
    total_partidas,
    cod_pais,
    cod_jogo
)
select
	jogador,
    genero,
    data_nascimento_tratada,
    num_vitorias,
    num_derrotas,
    total_partidas,
    pai.cod_pais,
    jog.cod_jogo
from 
	stg_jogador as stg
inner join
	pais as pai on 
		pai.nome_pais = stg.pais
inner join
	jogo as jog on 
		jog.nome_jogo = stg.jogo;