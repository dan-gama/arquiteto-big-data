insert into venda_veiculo (
	data_venda,
    valor_venda,
    cod_pessoa,
    cod_modelo
)
select
	stg.data_compra,
    stg.valor,
    stg.cod_pessoa,
    mve.cod_modelo
from 
	stg_venda_veiculo as stg
inner join
	modelo_veiculo as mve on 
		mve.descricao_modelo = stg.modelo