CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(255),
    Telefone CHAR(11)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idVCliente INT,
    Placa CHAR(7) NOT NULL,
    Modelo VARCHAR(45),
    Marca VARCHAR(45),
    CONSTRAINT unique_placa UNIQUE (Placa),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idVCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Mecânico
CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45),
    Endereco VARCHAR(255)
);

-- Tabela Ordem de Serviço (OS)
CREATE TABLE Ordem_Servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idOSVeiculo INT,
    DataEmissao DATE NOT NULL,
    DataEntrega DATE,
    Status ENUM('Aguardando', 'Em conserto', 'Finalizado', 'Cancelado') DEFAULT 'Aguardando',
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idOSVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Equipe_Mecanicos (Ligação entre Mecânico e OS)
CREATE TABLE Equipe_Mecanicos (
    idEM_Mecanico INT,
    idEM_OS INT,
    PRIMARY KEY (idEM_Mecanico, idEM_OS),
    CONSTRAINT fk_equipe_mecanico FOREIGN KEY (idEM_Mecanico) REFERENCES Mecanico(idMecanico),
    CONSTRAINT fk_equipe_os FOREIGN KEY (idEM_OS) REFERENCES Ordem_Servico(idOS)
);

-- Tabela de Referência de Preços (Serviços e Peças)
CREATE TABLE Referencia_Preco (
    idReferencia INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45),
    Valor_Mao_Obra FLOAT NOT NULL,
    Valor_Peca FLOAT DEFAULT 0
);

-- Tabela Itens da OS (Relacionamento entre OS e os Serviços/Peças)
CREATE TABLE Itens_OS (
    idIOS_OS INT,
    idIOS_Referencia INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (idIOS_OS, idIOS_Referencia),
    CONSTRAINT fk_itens_os FOREIGN KEY (idIOS_OS) REFERENCES Ordem_Servico(idOS),
    CONSTRAINT fk_itens_ref FOREIGN KEY (idIOS_Referencia) REFERENCES Referencia_Preco(idReferencia)
);
