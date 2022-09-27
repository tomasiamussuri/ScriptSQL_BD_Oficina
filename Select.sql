SELECT
clientes.idClientes AS "Cod Cliente"
,clientes.Nome AS "Nome"
,clientes.Identificacao AS "CPF/CNPJ"
,veiculos.Modelo AS "Veiculo"
,pedidos.idPedidos AS "Cod Pedido"
,pedidos.DataEntrada AS "Data Entrada"
,pedidos.DataAprovacao AS "Data Aprovação"
,SUM(ordemservico.Valor) AS "Valor"
-- ,ordemservico.id AS "Cod OrdemServico"

FROM pedidos
 
LEFT JOIN clientes ON
pedidos.Clientes_idClientes = clientes.idClientes

LEFT JOIN veiculos ON
pedidos.Clientes_has_Veiculos_Veiculos_idVeiculos = veiculos.idVeiculos

LEFT JOIN avaliacao ON
pedidos.idPedidos = avaliacao.PedidosAvaliacao_idPedidos

LEFT JOIN ordemservico ON
avaliacao.id = ordemservico.Avaliacao_id


WHERE pedidos.DataEntrada >= '20220901'

GROUP BY
clientes.idClientes
,clientes.Nome
,clientes.Identificacao
,veiculos.Modelo
,pedidos.idPedidos
,pedidos.DataEntrada
,pedidos.DataAprovacao

HAVING SUM(ordemservico.Valor) > '500.00'

ORDER BY 1