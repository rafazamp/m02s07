select pais.nome_pais, sum(cidade.qtd_populacao) from pais
inner join estado on pais.id_pais = estado.id_pais
inner join cidade on cidade.id_estado = estado.id_estado
group by pais.nome_pais
having sum(cidade.qtd_populacao) > 45316586