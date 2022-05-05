-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 05-Maio-2022 às 03:14
-- Versão do servidor: 8.0.22
-- versão do PHP: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `iptu_bd_evy_joao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

CREATE TABLE `area` (
  `id_poligono` int NOT NULL,
  `percentual_aliquota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `area`
--

INSERT INTO `area` (`id_poligono`, `percentual_aliquota`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 2.5),
(6, 0),
(7, 5),
(8, 0),
(9, 0),
(10, 0),
(11, 15),
(12, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `area_tipos`
--

CREATE TABLE `area_tipos` (
  `id_poligono` int NOT NULL,
  `id_tipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `area_tipos`
--

INSERT INTO `area_tipos` (`id_poligono`, `id_tipo`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 13),
(12, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `nome` varchar(100) NOT NULL,
  `regiao` varchar(45) NOT NULL,
  `nv_desenvolvimento` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo` varchar(100) NOT NULL,
  `id_prefeitura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`nome`, `regiao`, `nv_desenvolvimento`, `tipo`, `id_prefeitura`) VALUES
('america', 'centro', 'alto', 'residencial', 1),
('centro', 'centro', NULL, 'comercial', 1),
('padre augusto', 'centro', 'medio', 'comercial', 1),
('rei carmim', 'noroeste', 'baixo', 'residencial', 1),
('santa teresa', 'centro', 'alto', 'industrial', 1),
('casa grande', 'centro', 'medio', 'comercial', 4),
('centro', 'centro', 'alto', 'comercial', 4),
('padre julio', 'sul', 'baixo', 'residencial', 4),
('vila da folha', 'sul', 'medio', 'industrial', 4),
('voa crianca', 'sul', 'medio', 'industrial', 4),
('centro', 'centro', NULL, 'comercial', 6),
('parati', 'norte', 'medio', 'residencial', 11),
('boa esperanca', 'sudeste', 'baixo', 'residencial', 16),
('disney', 'sudeste', 'baixo', 'residencial', 16),
('voa crianca', 'norte', 'alto', 'residencial', 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `habitantes` int NOT NULL,
  `idh` varchar(25) DEFAULT NULL,
  `id_prefeitura` int NOT NULL,
  `id_poligono` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`habitantes`, `idh`, `id_prefeitura`, `id_poligono`) VALUES
(1005151, 'alto', 1, 1),
(5589994, 'baixo', 2, 2),
(454485, 'alto', 3, 3),
(5965944, 'medio', 4, 4),
(4484845, 'medio', 5, 5),
(59594459, 'alto', 6, 6),
(48484, 'baixo', 7, 7),
(448499, 'alto', 11, 8),
(4566669, 'muito baixo', 16, 9),
(5589454, 'baixo', 19, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `id` int NOT NULL,
  `proprietario` varchar(500) NOT NULL,
  `rgi` int NOT NULL,
  `tipo` varchar(45) NOT NULL DEFAULT 'residencial, comercial, religioso, publico',
  `valor venal` double NOT NULL,
  `id_logradouro` int NOT NULL,
  `coordenada` point DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`id`, `proprietario`, `rgi`, `tipo`, `valor venal`, `id_logradouro`, `coordenada`) VALUES
(1, 'luiz carlos', 554481, 'residencial', 144452.25, 19, NULL),
(2, 'joao claudio\r\nmarcelle alves', 554881, 'comercial', 4520141.3, 17, NULL),
(3, 'maria antonieta', 4554445, 'religioso', 400000.36, 19, NULL),
(4, 'anakin skywalker', 415632, 'religioso', 102351.69, 7, NULL),
(5, 'gon freecs', 445521, 'residencial', 14516321.58, 1, NULL),
(13, 'giba', 445421, 'comercial', 14566321.58, 1, NULL),
(14, 'leoncio', 4459621, 'residencial', 14516321.58, 1, NULL),
(15, 'killua zoldyck', 44541, 'residencial', 34516321.58, 9, NULL),
(16, 'killua zoldyck', 446521, 'residencial', 9451321.58, 9, NULL),
(17, 'killua zoldyck', 945521, 'residencial', 8416321.58, 9, NULL),
(18, 'saylor moon', 445531, 'residencial', 6516321.58, 17, NULL),
(19, 'yusuke urameshi', 145521, 'residencial', 1451637.58, 18, NULL),
(20, 'killua zoldyck', 5566921, 'comercial', 444561.39, 3, NULL),
(21, 'pneu center\r\n(teste)', 4412513, 'comercial', 445612.2, 2, 0xe61000000101000000d6a19654284a48c017ff66ba759234c0),
(24, 'joao marques\r\ncadisa industria e comercio', 5562314, 'comercial', 5968214, 4, 0xe610000001010000008d96569d424c47c08123a1cd1ab437c0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `iptu`
--

CREATE TABLE `iptu` (
  `id` int NOT NULL,
  `valor` double NOT NULL,
  `vencimento` date NOT NULL,
  `cadastro` date NOT NULL,
  `tipo` varchar(45) DEFAULT 'isento, progressivo, pagante',
  `id_imovel` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `iptu`
--

INSERT INTO `iptu` (`id`, `valor`, `vencimento`, `cadastro`, `tipo`, `id_imovel`) VALUES
(1, 520.61, '2022-05-06', '2022-05-05', 'pagante', 19),
(2, 452.63, '2022-05-20', '2022-05-05', 'pagante', 14),
(3, 350.21, '2022-05-20', '2022-05-01', 'progressivo', 18),
(4, 532, '2022-05-06', '2022-05-02', 'isento', 4),
(5, 540.78, '2017-05-01', '2015-05-01', 'pagante', 14),
(6, 690.25, '2027-05-06', '2022-05-05', 'pagante', 13),
(7, 630.45, '2022-05-20', '2022-05-05', 'progressivo', 15),
(8, 987.25, '2022-05-26', '2024-05-22', 'progressivo', 21),
(9, 453.32, '2022-05-13', '2022-05-12', NULL, 21),
(10, 520361, '2022-05-26', '2022-05-05', 'pagante', 24);

-- --------------------------------------------------------

--
-- Estrutura da tabela `logradouro`
--

CREATE TABLE `logradouro` (
  `id` int NOT NULL,
  `tipo` varchar(100) NOT NULL DEFAULT 'praca,avenida,rua',
  `nome` varchar(100) NOT NULL,
  `id_prefeitura` int NOT NULL,
  `nome_bairro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `logradouro`
--

INSERT INTO `logradouro` (`id`, `tipo`, `nome`, `id_prefeitura`, `nome_bairro`) VALUES
(1, 'rua', 'anselmo rei', 1, 'santa teresa'),
(2, 'rua', 'brasil', 1, 'america'),
(3, 'rua', 'colombia', 1, 'america'),
(4, 'avenida', 'fundibem', 4, 'casa grande'),
(6, 'rua', 'patricio de sa', 6, 'centro'),
(7, 'praca', 'augusto mendes', 19, 'voa crianca'),
(8, 'rua', 'quebra copo', 4, 'voa crianca'),
(9, 'avenida', 'subarashi', 4, 'vila da folha'),
(17, 'rua', 'pink floyd', 16, 'disney'),
(18, 'praca', 'antonio amado', 16, 'disney'),
(19, 'rua', 'pedro scooby', 19, 'voa crianca'),
(20, 'avenida', 'menino ney', 19, 'voa crianca'),
(22, 'praca', 'menino ney', 16, 'disney'),
(23, 'rua', 'brasil', 1, 'america');

-- --------------------------------------------------------

--
-- Estrutura da tabela `poligono`
--

CREATE TABLE `poligono` (
  `id` int NOT NULL,
  `geometria` polygon NOT NULL,
  `criacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `poligono`
--

INSERT INTO `poligono` (`id`, `geometria`, `criacao`) VALUES
(1, 0xe610000001030000000100000005000000f08975aa7c4948c03d7e6fd39f8934c00b0e2f88484548c082902c60029734c04626e0d7484e48c06c921ff12b8a34c085b18520074d48c00a14b188617f34c0f08975aa7c4948c03d7e6fd39f8934c0, '2022-05-04'),
(2, 0xe61000000103000000010000000500000024179b56106447c019d47e82147737c0934072be786147c053062fba438237c0a7b7c35c686647c008e367c41a9537c02a5231a5536847c0062e909f9f8537c024179b56106447c019d47e82147737c0, '2022-05-04'),
(3, 0xe6100000010300000001000000050000004b0055c4888a47c06ac4c9cb27d036c0560f9fc8558047c0b687581e65eb36c07f7c0d79ea9547c021c49503cc0537c0213a37a6918b47c0b56b3c13f9d036c04b0055c4888a47c06ac4c9cb27d036c0, '2022-05-04'),
(4, 0xe610000001030000000100000005000000934b4e424e5147c0f89452d270b037c0ae133eec384e47c04c335e4dd7aa37c01ce62e0b834a47c0509c3a1741b137c0ceaf5d20754e47c0c5186c1498bc37c0934b4e424e5147c0f89452d270b037c0, '2022-05-04'),
(5, 0xe610000001030000000100000004000000062f19783ec145c0f5e68531cd6634c06107a630e4c145c0cfc090c99c6434c0d8f44eb1acc045c089354bba1c6434c0062f19783ec145c0f5e68531cd6634c0, '2022-05-04'),
(6, 0xe61000000103000000010000000500000061953da2922e45c02e24d9bd9a2635c01cbbfc667a3345c0aac505b9112535c0aed0e775403045c079213f0b061d35c0ae58c91f262b45c0ededa4e4b91f35c061953da2922e45c02e24d9bd9a2635c0, '2022-05-04'),
(7, 0xe6100000010300000001000000040000004b8fe7a0af0045c014eb310771d136c00409e920d7fe44c0bb38d33e98da36c0d1d1e4201d0445c0bdf00ac162d336c04b8fe7a0af0045c014eb310771d136c0, '2022-05-04'),
(8, 0xe610000001030000000100000005000000cb630f68612e43c02fa036d77ba829c0c89743c3a12843c05fc61a3b9dda29c0fa37c2142e4343c0a6d0954dfc042ac0054321ae533d43c0f266cfd9c9b829c0cb630f68612e43c02fa036d77ba829c0, '2022-05-04'),
(9, 0xe610000001030000000100000005000000c4f6d6f5253548c02163835c7f623bc0c4f6d6f5253548c04c2c7c1f5a853bc0ac209abb8c4648c07ffedfc00bd53bc047502ae50e4548c080d16493c47a3bc0c4f6d6f5253548c02163835c7f623bc0, '2022-05-04'),
(10, 0xe610000001030000000100000005000000e32437c49da341c046b83db19ad216c06396a16cde9841c09646f9830b1217c0666c343b559641c011d8a0d7b59517c05e3479a068a241c07fa7e6e82d4017c0e32437c49da341c046b83db19ad216c0, '2022-05-04'),
(11, 0xe61000000103000000010000000500000083f8c08eff4a48c0f165a208a99334c02194f771344948c0d8d64fff599334c02194f771344948c0a301bc05129034c09148dbf8134b48c0d94125ae639034c083f8c08eff4a48c0f165a208a99334c0, '2022-05-04'),
(12, 0xe610000001030000000100000005000000959d7e50174d47c066f7e461a1b237c0261c7a8b874b47c0575bb1bfecb237c0226fb9fab14b47c0529d0e643db537c03cdd79e2394d47c0b3b45373b9b537c0959d7e50174d47c066f7e461a1b237c0, '2022-05-04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prefeitura`
--

CREATE TABLE `prefeitura` (
  `id` int NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `telefone` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(400) NOT NULL,
  `prefeito` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date DEFAULT NULL,
  `id_uf` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `prefeitura`
--

INSERT INTO `prefeitura` (`id`, `cidade`, `telefone`, `email`, `endereco`, `prefeito`, `inicio`, `fim`, `id_uf`) VALUES
(1, 'barretos', 221145566, 'ba@gmail.com', 'rua barretos', 'theo becker', '2022-05-04', '2026-05-01', 15),
(2, 'osasco', 2214457, 'osasco@gmail.com', 'rua osasco', 'donald trump', '2022-05-03', '2026-05-01', 15),
(3, 'campinas', 211145566, 'camp@gmail.com', 'rua campinas', 'nicole bahls', '2020-05-04', '2024-05-01', 15),
(4, 'diadema', 251145566, 'diadema@gmail.com', 'rua diadema', 'martin scorsese', '2020-05-04', '2024-05-01', 15),
(5, 'ouro preto', 3254456, 'ouropreto@gmail.com', 'rua ouro preto', 'tiradentes', '2022-05-03', '2025-05-14', 16),
(6, 'muriae', 3255456, 'muriae@gmail.com', 'rua muriae', 'atonio conselheiro', '2022-05-05', '2022-05-19', 16),
(7, 'cabo frio', 226654422, 'cf@gmail.com', 'rua cabo frio', 'joss stone', '2022-05-03', '2026-05-05', 17),
(8, 'friburgo', 226684422, 'fb@gmail.com', 'rua friburgo', 'roberto marinho', '2022-05-03', '2026-05-05', 17),
(9, 'sao pedro da aldeia', 276654422, 'spa@gmail.com', 'rua sao pedro', 'darth vader', '2022-05-03', '2026-05-05', 17),
(10, 'sobral', 4455788, 'sobral@gmail.com', 'rua sobral', 'ciro gomes', '2022-05-04', '2027-05-01', 18),
(11, 'salvador', 6654478, 'salvador@gmail.com', 'rua salvador', 'claudia leitte', '2022-05-04', '2027-05-01', 19),
(12, 'recife', 3654788, 'recife@gmail.com', 'rua recife', 'machado de assis', '2016-05-18', NULL, 20),
(13, 'goiania', 1122445, 'goiania@gmail.com', 'rua goiania', 'tony stark', '2022-05-04', '2026-05-01', 21),
(14, 'rio branco', 9988745, 'rb@gmail.com', 'rua rb', 'bruce wayne', '2022-05-04', '2022-05-10', 22),
(15, 'cerejeiras', 4477112, 'cr@gmail.com', 'rua cr', 'albertinho', '2022-05-11', '2027-05-05', 23),
(16, 'florianopolis', 4455117, 'floripa@gmail.com', 'rua floripa', 'edson nascimento', '2022-05-03', '2026-05-06', 24),
(17, 'porto alegre', 6655412, 'pa@gmail.com', 'rua porto alegre', 'king crimson', '2022-05-18', NULL, 25),
(18, 'cuiaba', 3366547, 'cuiaba@gmail.com', 'rua cuiaba', 'paul mccartney', '2022-05-24', '2022-05-27', 26),
(19, 'natal', 11446687, 'natal@gmail.com', 'rua natal', 'jose jesus', '2022-05-25', '2025-05-29', 27),
(20, 'belem', 9987754, 'belem@gmail.com', 'rua belem', 'chimbinha', '2022-05-18', '2026-05-26', 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos`
--

CREATE TABLE `tipos` (
  `id` int NOT NULL,
  `descricao` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipos`
--

INSERT INTO `tipos` (`id`, `descricao`) VALUES
(1, 'cidade'),
(2, 'bairro'),
(3, 'preservacao ambiental'),
(4, 'desenvolvimento'),
(5, 'nobre'),
(6, 'industrial'),
(7, 'risco'),
(8, 'zona1'),
(9, 'zona 2'),
(10, 'zona 3'),
(11, 'imovel1'),
(12, 'bairro casa grande - diadema'),
(13, 'america - Barretos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE `uf` (
  `id` int NOT NULL,
  `nome` varchar(200) NOT NULL,
  `regiao` varchar(400) NOT NULL,
  `governador` varchar(200) NOT NULL,
  `idh` varchar(45) DEFAULT 'alto,baixo,medio,muito baixo',
  `habitantes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uf`
--

INSERT INTO `uf` (`id`, `nome`, `regiao`, `governador`, `idh`, `habitantes`) VALUES
(15, 'sao paulo', 'sudeste', 'marilia mendonca', 'alto', 4001006),
(16, 'minas gerais', 'sudeste', 'michael jackson', 'alto', 4052010),
(17, 'rio de janeiro', 'sudeste', 'djonga', 'baixo', 4001540),
(18, 'ceara', 'nordeste', 'criolo', 'alto', 4452010),
(19, 'bahia', 'nordeste', 'lazaro ramos', 'medio', 4057006),
(20, 'pernambuco', 'nordeste', 'john lennon', 'alto', 4052450),
(21, 'goias', 'centro oeste', 'juma marrua', 'muito baixo', 4001422),
(22, 'acre', 'norte', 'barack obama', 'alto', 9052010),
(23, 'rondonia', 'norte', 'justin timberlake', 'alto', 4007806),
(24, 'santa catarina', 'sul', 'patati patata', 'baixo', 6252010),
(25, 'rio grande do sul', 'sul', 'justin bieber', 'muito baixo', 4003206),
(26, 'mato grosso', 'centro oeste', 'zorro', 'alto', 1252010),
(27, 'rio grande do norte', 'norte', 'eric clapton', 'baixo', 8001006),
(28, 'para', 'norte', 'joelma calypso', 'alto', 4092010);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_poligono`),
  ADD UNIQUE KEY `poligono_id_UNIQUE` (`id_poligono`),
  ADD KEY `fk_area_poligono1_idx` (`id_poligono`);

--
-- Índices para tabela `area_tipos`
--
ALTER TABLE `area_tipos`
  ADD PRIMARY KEY (`id_poligono`,`id_tipo`),
  ADD UNIQUE KEY `fk_area_has_tipos_area1_idx` (`id_poligono`) USING BTREE,
  ADD KEY `fk_area_has_tipos_tipos1_idx` (`id_tipo`);

--
-- Índices para tabela `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id_prefeitura`,`nome`),
  ADD KEY `fk_bairro_cidade1_idx` (`id_prefeitura`),
  ADD KEY `nome` (`nome`) USING BTREE;

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_prefeitura`),
  ADD UNIQUE KEY `prefeitura_id_UNIQUE` (`id_prefeitura`),
  ADD UNIQUE KEY `id_poligono_UNIQUE` (`id_poligono`),
  ADD KEY `fk_cidade_prefeitura1_idx` (`id_prefeitura`),
  ADD KEY `fk_cidade_poligono1_idx` (`id_poligono`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idimovel_UNIQUE` (`id`),
  ADD UNIQUE KEY `rgi_UNIQUE` (`rgi`),
  ADD KEY `fk_imovel_logradouro1_idx` (`id_logradouro`);

--
-- Índices para tabela `iptu`
--
ALTER TABLE `iptu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idiptu_UNIQUE` (`id`),
  ADD KEY `fk_iptu_imovel1_idx` (`id_imovel`);

--
-- Índices para tabela `logradouro`
--
ALTER TABLE `logradouro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  ADD KEY `fk_logradouro_bairro1_idx` (`id_prefeitura`,`nome_bairro`),
  ADD KEY `nome_UNIQUE` (`nome`) USING BTREE;

--
-- Índices para tabela `poligono`
--
ALTER TABLE `poligono`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices para tabela `prefeitura`
--
ALTER TABLE `prefeitura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  ADD UNIQUE KEY `endereco_UNIQUE` (`endereco`),
  ADD UNIQUE KEY `prefeito_UNIQUE` (`prefeito`),
  ADD UNIQUE KEY `cidade_UNIQUE` (`cidade`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_prefeitura_uf_idx` (`id_uf`);

--
-- Índices para tabela `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Índices para tabela `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `area`
--
ALTER TABLE `area`
  MODIFY `id_poligono` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_prefeitura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `iptu`
--
ALTER TABLE `iptu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `logradouro`
--
ALTER TABLE `logradouro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `poligono`
--
ALTER TABLE `poligono`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `prefeitura`
--
ALTER TABLE `prefeitura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `uf`
--
ALTER TABLE `uf`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `fk_area_poligono1` FOREIGN KEY (`id_poligono`) REFERENCES `poligono` (`id`);

--
-- Limitadores para a tabela `area_tipos`
--
ALTER TABLE `area_tipos`
  ADD CONSTRAINT `fk_area_has_tipos_area1` FOREIGN KEY (`id_poligono`) REFERENCES `area` (`id_poligono`),
  ADD CONSTRAINT `fk_area_has_tipos_tipos1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`);

--
-- Limitadores para a tabela `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `fk_bairro_cidade1` FOREIGN KEY (`id_prefeitura`) REFERENCES `cidade` (`id_prefeitura`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_poligono1` FOREIGN KEY (`id_poligono`) REFERENCES `poligono` (`id`),
  ADD CONSTRAINT `fk_cidade_prefeitura1` FOREIGN KEY (`id_prefeitura`) REFERENCES `prefeitura` (`id`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `fk_imovel_logradouro1` FOREIGN KEY (`id_logradouro`) REFERENCES `logradouro` (`id`);

--
-- Limitadores para a tabela `iptu`
--
ALTER TABLE `iptu`
  ADD CONSTRAINT `fk_iptu_imovel1` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id`);

--
-- Limitadores para a tabela `logradouro`
--
ALTER TABLE `logradouro`
  ADD CONSTRAINT `fk_logradouro_bairro1` FOREIGN KEY (`id_prefeitura`,`nome_bairro`) REFERENCES `bairro` (`id_prefeitura`, `nome`);

--
-- Limitadores para a tabela `prefeitura`
--
ALTER TABLE `prefeitura`
  ADD CONSTRAINT `fk_prefeitura_uf` FOREIGN KEY (`id_uf`) REFERENCES `uf` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
