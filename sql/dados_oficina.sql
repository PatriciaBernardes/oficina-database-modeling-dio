USE oficina_mecanica;

-- Inserindo Clientes
INSERT INTO Cliente (Nome, Endereco, Telefone) VALUES 
('Carlos Andrade', 'Rua 22, Ituiutaba', '34999991111'),
('Ana Paula', 'Av. Central, Ituiutaba', '34999992222');

-- Inserindo Veículos
INSERT INTO Veiculo (idVCliente, Placa, Modelo, Marca) VALUES 
(1, 'ABC1234', 'Hilux', 'Toyota'),
(2, 'XYZ5678', 'Corolla', 'Toyota');

-- Inserindo Mecânicos
INSERT INTO Mecanico (Nome, Especialidade) VALUES 
('João Mecânico', 'Motor e Câmbio'),
('Ricardo Silva', 'Suspensão e Freios');

-- Inserindo Catálogo de Preços
INSERT INTO Referencia_Preco (Descricao, Valor_Mao_Obra, Valor_Peca) VALUES 
('Troca de Óleo', 50.00, 150.00),
('Revisão de Freios', 120.00, 300.00),
('Alinhamento', 80.00, 0);

-- Inserindo Ordens de Serviço
INSERT INTO Ordem_Servico (idOSVeiculo, DataEmissao, DataEntrega, Status) VALUES 
(1, '2026-03-10', '2026-03-12', 'Finalizado'),
(2, '2026-03-12', NULL, 'Em conserto');

-- Designando Mecânicos para as OSs
INSERT INTO Equipe_Mecanicos (idEM_Mecanico, idEM_OS) VALUES (1, 1), (2, 2);

-- Inserindo Itens nas OSs
INSERT INTO Itens_OS (idIOS_OS, idIOS_Referencia, Quantidade) VALUES (1, 1, 1), (1, 3, 1), (2, 2, 1);
