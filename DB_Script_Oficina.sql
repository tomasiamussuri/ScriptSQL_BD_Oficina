-- Criando banco de dados
CREATE DATABASE IF NOT EXISTS oficina;


-- Criando tabela: CLIENTES
CREATE TABLE IF NOT EXISTS `oficina`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `Identificacao` VARCHAR(14) NOT NULL,
  `TipoCliente` VARCHAR(1) NOT NULL,
  `End_CEP` VARCHAR(8) NOT NULL,
  `End_Logradouro` VARCHAR(60) NOT NULL,
  `End_Numero` VARCHAR(5) NOT NULL,
  `End_Complemento` VARCHAR(45) NULL,
  `End_Bairro` VARCHAR(45) NOT NULL,
  `End_Cidade` VARCHAR(45) NOT NULL,
  `End_UF` VARCHAR(2) NOT NULL,
  `Telefone` VARCHAR(11) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`));
  
  
-- Criando tabela: FUNCIONARIOS
CREATE TABLE IF NOT EXISTS `oficina`.`Funcionarios` (
  `idFuncionarios` INT NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `End_CEP` VARCHAR(8) NOT NULL,
  `End_Logradouro` VARCHAR(60) NOT NULL,
  `End_Numero` VARCHAR(5) NOT NULL,
  `End_Complemento` VARCHAR(45) NULL,
  `End_Bairro` VARCHAR(45) NOT NULL,
  `End_Cidade` VARCHAR(45) NOT NULL,
  `End_UF` VARCHAR(2) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL,
  `Funcao` VARCHAR(45) NOT NULL,
  `DataInicio` DATE NOT NULL,
  `DataFim` DATE NULL,
  PRIMARY KEY (`idFuncionarios`));


-- Criando tabela: ESPECIALIDADE
CREATE TABLE IF NOT EXISTS `oficina`.`Especialidade` (
  `idFuncao` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncao`));
  
  
-- Criando tabela: TECNICOS
CREATE TABLE IF NOT EXISTS `oficina`.`Tecnicos` (
  `Funcionarios_idFuncionarios` INT NOT NULL,
  `Funcao_idFuncao` INT NOT NULL,
  `DataInicio` DATETIME NULL,
  `DataFim` DATETIME NULL,
  PRIMARY KEY (`Funcionarios_idFuncionarios`, `Funcao_idFuncao`),
  INDEX `fk_Funcionarios_has_Funcao_Funcao1_idx` (`Funcao_idFuncao` ASC) VISIBLE,
  INDEX `fk_Funcionarios_has_Funcao_Funcionarios_idx` (`Funcionarios_idFuncionarios` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionarios_has_Funcao_Funcionarios`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `oficina`.`Funcionarios` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionarios_has_Funcao_Funcao1`
    FOREIGN KEY (`Funcao_idFuncao`)
    REFERENCES `oficina`.`Especialidade` (`idFuncao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

  
-- Criando tabela: TIPO DE REVISAO
CREATE TABLE IF NOT EXISTS `oficina`.`TipoRevisao` (
  `idTipoServico` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Prazo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoServico`));


-- Criando tabela: FORNECEDORES
CREATE TABLE IF NOT EXISTS `oficina`.`Fornecedores` (
  `idFornecedores` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Identificacao` VARCHAR(14) NOT NULL,
  `TipoPessoa` VARCHAR(1) NOT NULL,
  `End_CEP` VARCHAR(8) NULL,
  `End_Logradouro` VARCHAR(60) NOT NULL,
  `End_Numero` VARCHAR(5) NOT NULL,
  `End_Complemento` VARCHAR(45) NULL,
  `End_Bairro` VARCHAR(45) NOT NULL,
  `End_Cidade` VARCHAR(45) NOT NULL,
  `End_UF` VARCHAR(2) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedores`));


-- Criando tabela: CORES
CREATE TABLE IF NOT EXISTS `oficina`.`Cores` (
  `idCores` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCores`));


-- Criando tabela: VEICULOS
CREATE TABLE IF NOT EXISTS `oficina`.`Veiculos` (
  `idVeiculos` INT NOT NULL,
  `Modelo` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Versao` VARCHAR(45) NULL,
  `Combustivel` VARCHAR(45) NULL,
  `QuantidadePortas` VARCHAR(45) NULL,
  PRIMARY KEY (`idVeiculos`));
  
  
  -- Criando tabela: VEICULOS DE CLIENTES
CREATE TABLE IF NOT EXISTS `oficina`.`Clientes_has_Veiculos` (
  `Clientes_idClientes` INT NOT NULL,
  `Veiculos_idVeiculos` INT NOT NULL,
  `Placa` VARCHAR(8) NOT NULL,
  `Cores_idCores` INT NOT NULL,
  PRIMARY KEY (`Clientes_idClientes`, `Veiculos_idVeiculos`),
  INDEX `fk_Clientes_has_Veiculos_Veiculos1_idx` (`Veiculos_idVeiculos` ASC) VISIBLE,
  INDEX `fk_Clientes_has_Veiculos_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Clientes_has_Veiculos_Cores1_idx` (`Cores_idCores` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_has_Veiculos_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `oficina`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Veiculos_Veiculos1`
    FOREIGN KEY (`Veiculos_idVeiculos`)
    REFERENCES `oficina`.`Veiculos` (`idVeiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Veiculos_Cores1`
    FOREIGN KEY (`Cores_idCores`)
    REFERENCES `oficina`.`Cores` (`idCores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    
-- Criando tabela: STATUS
CREATE TABLE IF NOT EXISTS `oficina`.`Status` (
  `idStatus` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`));
  
  
-- Criando tabela: PEDIDOS
CREATE TABLE IF NOT EXISTS `oficina`.`Pedidos` (
  `idPedidos` INT NOT NULL,
  `DataEntrada` DATETIME NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Status_idStatus` INT NOT NULL,
  `KM_Chegada` CHAR(5) NOT NULL,
  `KM_Saida` CHAR(5) NULL,
  `ProximaRevisao` CHAR(5) NULL,
  `ValorTotal` FLOAT NULL,
  `DataAprovacao` DATETIME NULL,
  `Clientes_has_Veiculos_Clientes_idClientes` INT NOT NULL,
  `Clientes_has_Veiculos_Veiculos_idVeiculos` INT NOT NULL,
  PRIMARY KEY (`idPedidos`, `Clientes_has_Veiculos_Clientes_idClientes`, `Clientes_has_Veiculos_Veiculos_idVeiculos`),
  INDEX `fk_Pedidos_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Pedidos_Status1_idx` (`Status_idStatus` ASC) VISIBLE,
  INDEX `fk_Pedidos_Clientes_has_Veiculos1_idx` (`Clientes_has_Veiculos_Clientes_idClientes` ASC, `Clientes_has_Veiculos_Veiculos_idVeiculos` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `oficina`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Status1`
    FOREIGN KEY (`Status_idStatus`)
    REFERENCES `oficina`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Clientes_has_Veiculos1`
    FOREIGN KEY (`Clientes_has_Veiculos_Clientes_idClientes` , `Clientes_has_Veiculos_Veiculos_idVeiculos`)
    REFERENCES `oficina`.`Clientes_has_Veiculos` (`Clientes_idClientes` , `Veiculos_idVeiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

  
-- Criando tabela: AVALIACAO
CREATE TABLE IF NOT EXISTS `oficina`.`Avaliacao` (
  `id` INT NOT NULL,
  `PedidosAvaliacao_idPedidos` INT NOT NULL,
  `Tecnicos_Funcionarios_idFuncionarios` INT NOT NULL,
  `Tecnicos_Funcao_idFuncao` INT NOT NULL,
  `DataEntrada` DATETIME NOT NULL,
  `DataInicio` DATETIME NULL,
  `DataFim` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PedidosAvaliacao_has_Tecnicos_Tecnicos1_idx` (`Tecnicos_Funcionarios_idFuncionarios` ASC, `Tecnicos_Funcao_idFuncao` ASC) VISIBLE,
  INDEX `fk_PedidosAvaliacao_has_Tecnicos_PedidosAvaliacao1_idx` (`PedidosAvaliacao_idPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_PedidosAvaliacao_has_Tecnicos_PedidosAvaliacao1`
    FOREIGN KEY (`PedidosAvaliacao_idPedidos`)
    REFERENCES `oficina`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidosAvaliacao_has_Tecnicos_Tecnicos1`
    FOREIGN KEY (`Tecnicos_Funcionarios_idFuncionarios` , `Tecnicos_Funcao_idFuncao`)
    REFERENCES `oficina`.`Tecnicos` (`Funcionarios_idFuncionarios` , `Funcao_idFuncao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

-- Criando tabela: SERVICOS
CREATE TABLE IF NOT EXISTS `oficina`.`Servicos` (
  `idServicos` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Especialidade_idFuncao` INT NOT NULL,
  PRIMARY KEY (`idServicos`),
  INDEX `fk_Servicos_Especialidade1_idx` (`Especialidade_idFuncao` ASC) VISIBLE,
  CONSTRAINT `fk_Servicos_Especialidade1`
    FOREIGN KEY (`Especialidade_idFuncao`)
    REFERENCES `oficina`.`Especialidade` (`idFuncao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
-- Criando tabela: CUSTO DE SERVICO
CREATE TABLE IF NOT EXISTS `oficina`.`CustoServico` (
  `idCustoServico` INT NOT NULL,
  `Valor` FLOAT NULL,
  `DataInicio` DATETIME NULL,
  `DataFim` DATETIME NULL,
  `Servicos_idServicos` INT NOT NULL,
  PRIMARY KEY (`idCustoServico`, `Servicos_idServicos`),
  INDEX `fk_CustoServico_Servicos1_idx` (`Servicos_idServicos` ASC) VISIBLE,
  CONSTRAINT `fk_CustoServico_Servicos1`
    FOREIGN KEY (`Servicos_idServicos`)
    REFERENCES `oficina`.`Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
-- Criando tabela: ORDEM DE SERVICO
CREATE TABLE IF NOT EXISTS `oficina`.`OrdemServico` (
  `id` INT NOT NULL,
  `TipoServico_idTipoServico` INT NOT NULL,
  `DataEntrada` DATETIME NOT NULL,
  `DataInicioServico` DATETIME NULL,
  `DataFimServico` DATETIME NULL,
  `DataFim_Previsao` DATETIME NULL,
  `Valor` FLOAT NULL,
  `Status` VARCHAR(45) NULL,
  `Avaliacao_id` INT NOT NULL,
  `CustoServico_idCustoServico` INT NOT NULL,
  `CustoServico_Servicos_idServicos` INT NOT NULL,
  PRIMARY KEY (`id`, `TipoServico_idTipoServico`, `Avaliacao_id`),
  INDEX `fk_TipoServico_has_Pedidos_TipoServico1_idx` (`TipoServico_idTipoServico` ASC) VISIBLE,
  INDEX `fk_OrdemServico_Avaliacao1_idx` (`Avaliacao_id` ASC) VISIBLE,
  INDEX `fk_OrdemServico_CustoServico1_idx` (`CustoServico_idCustoServico` ASC, `CustoServico_Servicos_idServicos` ASC) VISIBLE,
  CONSTRAINT `fk_TipoServico_has_Pedidos_TipoServico1`
    FOREIGN KEY (`TipoServico_idTipoServico`)
    REFERENCES `oficina`.`TipoRevisao` (`idTipoServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Avaliacao1`
    FOREIGN KEY (`Avaliacao_id`)
    REFERENCES `oficina`.`Avaliacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_CustoServico1`
    FOREIGN KEY (`CustoServico_idCustoServico` , `CustoServico_Servicos_idServicos`)
    REFERENCES `oficina`.`CustoServico` (`idCustoServico` , `Servicos_idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- Criando tabela: PECAS
CREATE TABLE IF NOT EXISTS `oficina`.`Pecas` (
  `idPecas` INT NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Valor` FLOAT NOT NULL,
  `Fornecedores_idFornecedores` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`idPecas`),
  INDEX `fk_Pecas_Fornecedores1_idx` (`Fornecedores_idFornecedores` ASC) VISIBLE,
  CONSTRAINT `fk_Pecas_Fornecedores1`
    FOREIGN KEY (`Fornecedores_idFornecedores`)
    REFERENCES `oficina`.`Fornecedores` (`idFornecedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


  
  




