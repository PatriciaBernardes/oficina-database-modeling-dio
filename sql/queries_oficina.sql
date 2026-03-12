USE oficina_mecanica;

-- 1. Recuperação simples: Listar todos os clientes
SELECT * FROM Cliente;

-- 2. Filtro: Veículos da marca 'Toyota'
SELECT Modelo, Placa FROM Veiculo WHERE Marca = 'Toyota';

-- 3. Atributo derivado: Valor total por item (Mão de obra + Peça)
SELECT Descricao, (Valor_Mao_Obra + Valor_Peca) AS Valor_Unitario_Total FROM Referencia_Preco;

-- 4. Ordenação: Peças/Serviços mais caros primeiro
SELECT * FROM Referencia_Preco ORDER BY Valor_Peca DESC;

-- 5. Junção Complexa: Cliente, Veículo e Mecânico responsável pela OS
SELECT 
    c.Nome AS Cliente, 
    v.Modelo, 
    m.Nome AS Mecanico, 
    os.Status
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idVCliente
JOIN Ordem_Servico os ON v.idVeiculo = os.idOSVeiculo
JOIN Equipe_Mecanicos em ON os.idOS = em.idEM_OS
JOIN Mecanico m ON em.idEM_Mecanico = m.idMecanico;

-- 6. Agrupamento e Filtro de Grupo: Valor total por OS acima de 200 reais
SELECT 
    idIOS_OS AS Numero_OS, 
    SUM((ref.Valor_Mao_Obra + ref.Valor_Peca) * ios.Quantidade) AS Total_OS
FROM Itens_OS ios
JOIN Referencia_Preco ref ON ios.idIOS_Referencia = ref.idReferencia
GROUP BY idIOS_OS
HAVING Total_OS > 200;
