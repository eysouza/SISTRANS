-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 13-Jul-2021 às 12:34
-- Versão do servidor: 5.6.41
-- versão do PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sgt_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_abastecimento`
--

CREATE TABLE `tb_abastecimento` (
  `id_abastece_pk` int(11) NOT NULL,
  `data_hora_abt` datetime DEFAULT NULL,
  `estabelecimento_abt` varchar(150) DEFAULT NULL,
  `hodometro_abt` int(11) DEFAULT NULL,
  `qtd_litros_abt` int(11) DEFAULT NULL,
  `valor_unit_abt` decimal(10,0) DEFAULT NULL,
  `id_motorista_fk` int(11) NOT NULL,
  `id_veiculo_fk` int(11) NOT NULL,
  `id_combustivel_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_combustivel`
--

CREATE TABLE `tb_combustivel` (
  `id_combustivel_pk` int(11) NOT NULL,
  `descricao_cbt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_combustivel`
--

INSERT INTO `tb_combustivel` (`id_combustivel_pk`, `descricao_cbt`) VALUES
(1, 'Gasolina'),
(2, 'Etanol'),
(3, 'Diesel'),
(4, 'GNV');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id_fabricante_pk` int(11) NOT NULL,
  `nome_fab` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_fabricante`
--

INSERT INTO `tb_fabricante` (`id_fabricante_pk`, `nome_fab`) VALUES
(1, 'Audi'),
(2, 'BMW'),
(3, 'Chery'),
(4, 'Chevrolet'),
(5, 'Citroën'),
(6, 'Fiat'),
(7, 'Ford'),
(8, 'Honda'),
(9, 'Hyundai'),
(10, 'Land Rover'),
(11, 'Mercedes-Benz'),
(12, 'Mitsubishi'),
(13, 'Nissan'),
(14, 'Peugeot'),
(15, 'Renault'),
(16, 'Toyota'),
(17, 'Troller'),
(18, 'Volkswagen'),
(19, 'Volvo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_motorista`
--

CREATE TABLE `tb_motorista` (
  `id_motorista_pk` int(11) NOT NULL,
  `nome_mot` varchar(150) DEFAULT NULL,
  `cpf_mot` varchar(14) DEFAULT NULL,
  `cnh_mot` varchar(15) DEFAULT NULL,
  `categoria_cnh_mot` varchar(5) DEFAULT NULL,
  `fone_mot` varchar(15) DEFAULT NULL,
  `email_mot` varchar(150) DEFAULT NULL,
  `status_mot` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_motorista`
--

INSERT INTO `tb_motorista` (`id_motorista_pk`, `nome_mot`, `cpf_mot`, `cnh_mot`, `categoria_cnh_mot`, `fone_mot`, `email_mot`, `status_mot`) VALUES
(1, 'Fernando Ferreira da Silva Junior', '12004634200', '0', 'B', NULL, NULL, 1),
(2, 'Aldenor Rodrigues', '29126878291', '0', 'B', NULL, NULL, 0),
(3, 'Clodomilton Gomes', '00000000000', '0', 'B', NULL, NULL, 0),
(4, 'José Alberto dos Santos Lins', '05311314249', '0', 'B', NULL, NULL, 0),
(5, 'Amarildo', '00000000000', '0', 'B', NULL, NULL, 0),
(6, 'Adriano de Santana', '00231928289', '0', 'B', NULL, NULL, 0),
(7, 'Daniel Andrade', '00000000000', '0', 'B', NULL, NULL, 1),
(8, 'Diego Batista', '00000000000', '0', 'B', NULL, NULL, 1),
(9, 'Diogenes Araujo', '00000000000', '0', 'B', NULL, NULL, 1),
(10, 'Andreney Laranjeira dos Santos', '58473114272', '00126740789', 'AB', '92982473647', 'andreney@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_perfil`
--

CREATE TABLE `tb_perfil` (
  `id_perfil_pk` int(11) NOT NULL,
  `descricao_prf` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_perfil`
--

INSERT INTO `tb_perfil` (`id_perfil_pk`, `descricao_prf`) VALUES
(1, 'Administrador'),
(2, 'Gestor'),
(3, 'Usuário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servico`
--

CREATE TABLE `tb_servico` (
  `id_servico_pk` int(11) NOT NULL,
  `data_srv` date DEFAULT NULL,
  `km_srv` varchar(10) DEFAULT NULL,
  `obs_srv` varchar(250) DEFAULT NULL,
  `id_tp_servico_fk` int(11) NOT NULL,
  `id_veiculo_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_setor`
--

CREATE TABLE `tb_setor` (
  `id_setor_pk` int(11) NOT NULL,
  `nome_str` varchar(150) DEFAULT NULL,
  `sigla_str` varchar(20) DEFAULT NULL,
  `mail_str` varchar(150) NOT NULL,
  `status_str` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_setor`
--

INSERT INTO `tb_setor` (`id_setor_pk`, `nome_str`, `sigla_str`, `mail_str`, `status_str`) VALUES
(1, 'Assessoria Jurídica', 'ASJUR', '', 1),
(2, 'Assessoria da Presidência', 'ASPRED', '', 1),
(3, 'Diretoria Administrativo Financeira', 'DAF', '', 1),
(4, 'Departamento de Acompanhamento e Avaliação', 'DEAC', '', 1),
(5, 'Departamento de Análise de Projetos', 'DEAP', '', 1),
(6, 'Departamento de Difusão do Conhecimento', 'DECON', '', 1),
(7, 'Departamento de Operação e Fomento', 'DEOF', '', 1),
(8, 'Diretoria Técnico Científica', 'DITEC', '', 1),
(9, 'GABINETE', 'GABINETE', '', 1),
(10, 'Gerência de Apoio Logístico', 'GEAL', '', 1),
(11, 'Gerência de Finanças', 'GEFI', '', 1),
(12, 'Gerência de Informática', 'GEINF', '', 1),
(13, 'Gerência de Orçamento', 'GEOR', '', 1),
(14, 'Gerência de Pessoal', 'GEPE', '', 1),
(15, 'Núcleo de Auditoria e Controle', 'NUAC', '', 0),
(16, 'Núcleo de Arquivo', 'NUAQ', '', 1),
(17, 'Núcleo de Contabilidade', 'NUCB', '', 1),
(18, 'Núcleo de Contratos', 'NUCT', '', 1),
(19, 'Núcleo de Convênio', 'NUCV', '', 1),
(20, 'Núcleo de Prestação de Contas', 'NUPC', '', 1),
(21, 'Núcleo de Patrimônio', 'NUPA', '', 1),
(22, 'Secretaria dos Conselhos', 'CONSELHOS', '', 1),
(23, 'Tomada de Contas Especial', 'CTCE', '', 1),
(24, 'Protocolo', 'PROTOCOLO', '', 1),
(25, 'Externo', 'EXTERNO', '', 1),
(26, 'Setor Externo', 'Teste', '', 0),
(29, 'Unidade de Controle Interno', 'UCI', '', 1),
(30, 'Ouvidoria', 'Ouvidoria', '', 1),
(31, 'Programas FINEP - Centelha', 'CENTELHA', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_solicitacao`
--

CREATE TABLE `tb_solicitacao` (
  `id_solicita_pk` int(11) NOT NULL,
  `datahora_registro_sol` datetime DEFAULT NULL,
  `data_pretendida_sol` date DEFAULT NULL,
  `destino_sol` varchar(255) DEFAULT NULL,
  `hora_pretendida_sol` time DEFAULT NULL,
  `justificativa_sol` text,
  `prioridade_sol` tinyint(1) DEFAULT NULL,
  `km_saida_sol` int(11) DEFAULT NULL,
  `hora_saida_sol` time DEFAULT NULL,
  `km_chegada_sol` int(11) DEFAULT NULL,
  `hora_chegada_sol` time DEFAULT NULL,
  `observacao_sol` text,
  `transp_pess` int(11) NOT NULL,
  `transp_doc` int(11) NOT NULL,
  `transp_carga` int(11) NOT NULL,
  `qtd_pessoas` int(11) NOT NULL,
  `id_motorista_fk` int(11) NOT NULL,
  `id_veiculo_fk` int(11) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  `id_status_sol_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_solicitacao`
--

INSERT INTO `tb_solicitacao` (`id_solicita_pk`, `datahora_registro_sol`, `data_pretendida_sol`, `destino_sol`, `hora_pretendida_sol`, `justificativa_sol`, `prioridade_sol`, `km_saida_sol`, `hora_saida_sol`, `km_chegada_sol`, `hora_chegada_sol`, `observacao_sol`, `transp_pess`, `transp_doc`, `transp_carga`, `qtd_pessoas`, `id_motorista_fk`, `id_veiculo_fk`, `id_usuario_fk`, `id_status_sol_fk`) VALUES
(14, '2021-06-24 16:19:00', '2021-06-25', 'Antiga sede', '08:30:00', 'Atender solicitação de desarquivamento', 0, NULL, NULL, NULL, '13:00:00', NULL, 1, 0, 1, 1, 1, 18, 206, 1),
(15, '2021-06-23 16:50:00', '2021-06-24', 'Antiga sede', '09:00:00', 'Limpeza das salas e organização de caixas', 0, NULL, NULL, NULL, '11:00:00', NULL, 0, 0, 1, 1, 1, 18, 206, 1),
(16, '2021-06-23 08:02:00', '2021-06-23', 'antiga sede - FAPEAM', '09:00:00', 'atender solicitação urgente do DEAC', 0, NULL, NULL, NULL, '10:00:00', NULL, 0, 0, 1, 1, 1, 18, 206, 1),
(17, '2021-06-22 16:48:00', '2021-06-23', 'antiga sede - FAPEAM', '14:00:00', 'transferência de caixas', 0, NULL, NULL, NULL, '15:00:00', NULL, 1, 0, 1, 1, 1, 18, 206, 1),
(18, '2021-06-22 16:44:00', '2021-06-23', 'SEAD', '09:00:00', ' Reunião.', 0, NULL, NULL, NULL, '11:00:00', NULL, 0, 0, 1, 1, 1, 18, 71, 2),
(19, '2021-06-22 12:55:00', '2021-06-22', 'BANCO DO BRASIL', '14:00:00', 'entrega de documentos', 0, NULL, NULL, NULL, '11:00:00', NULL, 0, 0, 1, 1, 1, 18, 16, 2),
(20, '2021-06-22 12:50:00', '2021-06-22', 'QUEIROZ- DJALMA BATISTA', '14:15:00', 'Compra de materias para festa junina', 0, NULL, NULL, NULL, '15:30:00', NULL, 0, 0, 1, 2, 1, 18, 60, 2),
(21, '2021-06-22 08:39:00', '2021-06-22', 'SEFAZ', '09:00:00', 'visita técnica ao protocolo da SEFAZ', 0, NULL, NULL, NULL, '10:30:00', NULL, 0, 0, 1, 1, 1, 18, 206, 5),
(22, '2021-06-21 15:59:00', '2021-06-22', 'Antiga sede - FAPEAM', '09:00:00', 'Transferência de caixas', 0, NULL, NULL, NULL, '10:00:00', NULL, 1, 0, 1, 2, 1, 18, 206, 5),
(23, '2021-06-21 11:33:00', '2021-06-21', 'BANCO DO BRASIL', '13:00:00', 'entrega de documentos', 0, NULL, NULL, NULL, '13:30:00', NULL, 0, 0, 1, 1, 1, 18, 16, 2),
(24, '2021-06-18 15:53:00', '2021-06-21', 'SEAD', '09:00:00', 'TRATAR DO ANTEPROJETO DA LEI DELEGADA Nº 116/2017.', 0, NULL, NULL, NULL, '02:00:00', NULL, 0, 0, 1, 1, 1, 18, 65, 6),
(25, '2021-06-18 12:58:00', '2021-06-18', 'antiga sede', '13:30:00', 'Boa tarde. Devido a mudança na segunda,, vamos ver...', 0, NULL, NULL, NULL, '16:00:00', NULL, 0, 0, 1, 1, 1, 18, 206, 2),
(26, '2021-06-17 16:45:00', '2021-06-18', 'antiga sede - FAPEAM', '08:30:00', 'arquivamento da documentação', 0, NULL, NULL, NULL, '10:00:00', NULL, 1, 0, 1, 1, 1, 18, 206, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_status_solicitacao`
--

CREATE TABLE `tb_status_solicitacao` (
  `id_status_sol_pk` int(11) NOT NULL,
  `descricao_sts` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_status_solicitacao`
--

INSERT INTO `tb_status_solicitacao` (`id_status_sol_pk`, `descricao_sts`) VALUES
(1, 'Aberta'),
(2, 'Recebida'),
(3, 'Agendada'),
(4, 'Recusada'),
(5, 'Atendida'),
(6, 'Cancelada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipos_servico`
--

CREATE TABLE `tb_tipos_servico` (
  `id_tp_servico_pk` int(11) NOT NULL,
  `descricao_tps` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_tipos_servico`
--

INSERT INTO `tb_tipos_servico` (`id_tp_servico_pk`, `descricao_tps`) VALUES
(1, 'TROCA DE ÓLEO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_proprietario`
--

CREATE TABLE `tb_tipo_proprietario` (
  `id_tp_prop_pk` int(11) NOT NULL,
  `descricao_tpp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_tipo_proprietario`
--

INSERT INTO `tb_tipo_proprietario` (`id_tp_prop_pk`, `descricao_tpp`) VALUES
(1, 'Instituição'),
(2, 'Locação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usr_prf`
--

CREATE TABLE `tb_usr_prf` (
  `id_usr_prf` int(11) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  `id_perfil_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_usr_prf`
--

INSERT INTO `tb_usr_prf` (`id_usr_prf`, `id_usuario_fk`, `id_perfil_fk`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 4, 1),
(5, 4, 2),
(6, 4, 3),
(7, 5, 1),
(8, 5, 2),
(9, 5, 3),
(10, 7, 1),
(11, 7, 2),
(12, 7, 3),
(13, 9, 1),
(14, 9, 2),
(15, 9, 3),
(16, 11, 1),
(17, 11, 2),
(18, 11, 3),
(19, 46, 2),
(20, 46, 3),
(21, 52, 2),
(22, 52, 3),
(23, 57, 2),
(24, 57, 3),
(25, 58, 2),
(26, 58, 3),
(27, 32, 3),
(28, 33, 3),
(29, 34, 3),
(30, 35, 3),
(31, 36, 3),
(32, 37, 3),
(33, 38, 3),
(34, 39, 3),
(35, 40, 3),
(36, 41, 3),
(37, 75, 3),
(38, 76, 3),
(39, 77, 3),
(40, 78, 3),
(41, 79, 3),
(42, 80, 3),
(43, 81, 3),
(44, 82, 3),
(45, 83, 3),
(46, 84, 3),
(47, 85, 3),
(48, 86, 3),
(49, 87, 3),
(50, 88, 3),
(51, 89, 3),
(52, 90, 3),
(53, 91, 3),
(54, 92, 3),
(55, 93, 3),
(56, 94, 3),
(57, 95, 3),
(58, 96, 3),
(59, 97, 3),
(60, 98, 3),
(61, 99, 3),
(62, 100, 3),
(63, 101, 3),
(64, 102, 3),
(65, 103, 3),
(66, 104, 3),
(67, 105, 3),
(68, 106, 3),
(69, 107, 3),
(70, 108, 3),
(71, 109, 3),
(72, 110, 3),
(73, 111, 3),
(74, 112, 3),
(75, 113, 3),
(76, 114, 3),
(77, 115, 3),
(78, 116, 3),
(79, 117, 3),
(80, 118, 3),
(81, 119, 3),
(82, 120, 3),
(83, 121, 3),
(84, 122, 3),
(85, 123, 3),
(86, 124, 3),
(87, 125, 3),
(88, 126, 3),
(89, 127, 3),
(90, 128, 3),
(91, 129, 3),
(92, 130, 3),
(93, 131, 3),
(94, 132, 3),
(95, 133, 3),
(96, 134, 3),
(97, 135, 3),
(98, 136, 3),
(99, 137, 3),
(100, 138, 3),
(101, 139, 3),
(102, 140, 3),
(103, 141, 3),
(104, 142, 3),
(105, 143, 3),
(106, 144, 3),
(107, 145, 3),
(108, 146, 3),
(109, 147, 3),
(110, 148, 3),
(111, 149, 3),
(112, 150, 3),
(113, 151, 3),
(114, 152, 3),
(115, 153, 3),
(116, 154, 3),
(117, 155, 3),
(118, 156, 3),
(119, 157, 3),
(120, 158, 3),
(121, 159, 3),
(122, 160, 3),
(123, 161, 3),
(124, 213, 3),
(125, 214, 3),
(126, 215, 3),
(127, 12, 3),
(128, 13, 3),
(129, 14, 3),
(130, 15, 3),
(131, 16, 3),
(132, 17, 3),
(133, 18, 3),
(134, 19, 3),
(135, 20, 3),
(136, 21, 3),
(137, 22, 3),
(138, 23, 3),
(139, 24, 3),
(140, 25, 3),
(141, 26, 3),
(142, 27, 3),
(143, 28, 3),
(144, 29, 3),
(145, 30, 3),
(146, 31, 3),
(147, 59, 3),
(148, 60, 3),
(149, 61, 3),
(150, 62, 3),
(151, 63, 3),
(152, 64, 3),
(153, 65, 3),
(154, 66, 3),
(155, 67, 3),
(156, 68, 3),
(157, 69, 3),
(158, 70, 3),
(159, 71, 3),
(160, 72, 3),
(161, 73, 3),
(162, 74, 3),
(163, 181, 3),
(164, 182, 3),
(165, 183, 3),
(166, 184, 3),
(167, 185, 3),
(168, 186, 3),
(169, 187, 3),
(170, 188, 3),
(171, 189, 3),
(172, 190, 3),
(173, 191, 3),
(174, 192, 3),
(175, 193, 3),
(176, 194, 3),
(177, 195, 3),
(178, 196, 3),
(179, 197, 3),
(180, 198, 3),
(181, 199, 3),
(182, 200, 3),
(183, 201, 3),
(184, 202, 3),
(185, 203, 3),
(186, 204, 3),
(187, 205, 3),
(188, 206, 3),
(189, 207, 3),
(190, 208, 3),
(191, 209, 3),
(192, 210, 3),
(193, 211, 3),
(194, 212, 3),
(195, 216, 3),
(196, 217, 3),
(197, 218, 3),
(198, 219, 3),
(199, 220, 3),
(200, 221, 3),
(201, 222, 3),
(202, 223, 3),
(203, 224, 3),
(204, 225, 3),
(205, 226, 3),
(206, 42, 3),
(207, 44, 3),
(208, 45, 3),
(209, 48, 3),
(210, 50, 3),
(211, 51, 3),
(212, 53, 3),
(213, 54, 3),
(214, 55, 3),
(215, 56, 3),
(216, 162, 3),
(217, 163, 3),
(218, 164, 3),
(219, 165, 3),
(220, 166, 3),
(221, 167, 3),
(222, 168, 3),
(223, 169, 3),
(224, 170, 3),
(225, 171, 3),
(226, 172, 3),
(227, 173, 3),
(228, 174, 3),
(229, 175, 3),
(230, 176, 3),
(231, 177, 3),
(232, 178, 3),
(233, 179, 3),
(234, 180, 3),
(235, 230, 2),
(236, 230, 3),
(237, 231, 1),
(238, 231, 2),
(239, 231, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario_pk` int(11) NOT NULL,
  `nome_usr` varchar(150) DEFAULT NULL,
  `cpf_usr` varchar(14) DEFAULT NULL,
  `email_usr` varchar(150) DEFAULT NULL,
  `img_profile_usr` varchar(100) DEFAULT 'profile1.png',
  `login_usr` varchar(45) DEFAULT NULL,
  `senha_usr` varchar(40) DEFAULT NULL,
  `status_usr` tinyint(1) DEFAULT NULL,
  `id_setor_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario_pk`, `nome_usr`, `cpf_usr`, `email_usr`, `img_profile_usr`, `login_usr`, `senha_usr`, `status_usr`, `id_setor_fk`) VALUES
(1, 'Mônica Lima', '00461486202', '', '', 'mlima', 'a72526b25fd89f2d1196a4b0d5d4208c', 1, 12),
(2, 'Fernanda Luiza Ribeiro Coutinho', '01193005248', '', '', 'fcoutinho', '01bf867c8881d749d5d4e46529ba59f1', 0, 12),
(3, 'Waldir Feitoza de Azevedo Neto', '01039964273', '', '', 'wazevedo', '6e5b2b08b36526f01261064f6f8a2a4c', 0, 12),
(4, 'Luiz Felipe dos Santos Gomes', '01551705206', '', '', 'lfelipe', 'e10adc3949ba59abbe56e057f20f883e', 1, 12),
(5, 'Andreney Laranjeira dos Santos', '58473114272', '', '', 'alaranjeira', '737369f8734738879e6c50e710e62c5f', 1, 12),
(6, 'Isabela Sousa de Souza', '02701374243', '', '', 'isouza', '299a61d8b07e7266eb9b82a324d5772e', 0, 12),
(7, 'Emmily Yasmin Santos de Souza', '01654717274', '', '', 'esantos', '15b37ab5757464e63bd1b56205b10a2f', 1, 12),
(8, 'Elissandra Machado Neves', '02848085207', '', '', 'eneves', '51a60529a03cf79333a28e3023a87020', 0, 12),
(9, 'Haila Suelem de Souza Laranjeira', '01898960275', '', '', 'hsouza', '123456', 1, 12),
(10, 'Pedro Henrique Matos de Brito', '03919041240', '', '', 'pbrito', '46ddcb0cc1278b11cda3b6dd7fd14258', 0, 12),
(11, 'Eduardo Couto', '44177232220', '', '', 'ecouto', '8ec737ed4a3fae77fa96e94ac0cc4c21', 1, 12),
(12, 'Andrel Marinho de Souza', '00462199274', '', '', 'amsouza', '7883cd972fae98cf6368d5699baa6e8e', 1, 11),
(13, 'Jeannye Melo da Silva', '84332921291', '', '', 'jmelo', '86f2121920592c8a37dbb1fbbe82e187', 1, 11),
(14, 'Rodrigo Oliveira dos Santos', '03425547275', '', '', 'rsantos', '35567a0e08f12dc2b3b95c2666a05e49', 1, 11),
(15, 'Paulo Silva', '98489232253', '', '', 'psilva', '0e0ef867c01440aa7287287e18586f0d', 1, 11),
(16, 'Michelle Cavalcante da Silva Oliveira', '01743765290', '', '', 'moliveira', '0f11e86b531d25417d25aa14a1e9bcd0', 1, 11),
(17, 'Tiago de Melo Parédio', '00925880264', '', '', 'tparedio', 'cdff4d8107e8280c72e4cbefea9f654c', 1, 11),
(18, 'Maria Raizidora de Oliveira Zurra', '43687911268', '', '', 'mzurra', 'b3ec8e1f1db83b549802a65f6a147e75', 1, 11),
(19, 'Jameson Barroso da Silva', '02197064258', '', '', 'jbsilva', 'f7c246bae29ccc0c69d66afb0b14f545', 1, 11),
(20, 'João Raphael de Oliveira Campos', '66361893200', '', '', 'jcampos', 'e05761c09a950c84c34d43f403d0532f', 1, 11),
(21, 'João Laborda', '59832452287', '', '', 'jlaborda', 'ef33813ce0a705251d6887ba682e735e', 1, 11),
(22, 'Luiz Ferreira Neves Neto', '51216795215', '', '', 'lneto', '5258b4ae677335e5188f1c2d9b055e7e', 1, 11),
(23, 'Gilmara Ferreira', '93945833272', '', '', 'gferreira', 'b8c88105e861d26462cf2be01c178aa0', 1, 11),
(24, 'Matheus do Nascimento Souza', '02737223288', '', '', 'msouza', '59e0d9a88ca1353e98a8aec163b51e95', 1, 11),
(25, 'Ana Cardoso', '58800948200', '', '', 'acardoso', '38a4c3788d458ec6216c81ffd28b97a5', 1, 11),
(26, 'Raphael Brito dos Santos', '87674050297', '', '', 'rbsantos', '4a2630549317a003eae264c248e05a65', 1, 20),
(27, 'Layane PatrÃ­cio Mota', '01550590251', '', '', 'lmota', 'a1dfebd6f9bfb84aa95a59cd52db12ab', 1, 20),
(28, 'Katyane Borges da Rocha', '01126355208', '', '', 'kborges', 'fe6a8ced7cdd79106658827cd74970d6', 1, 20),
(29, 'sabrina da silva ribeiro', '02722125200', '', '', 'sribeiro', '9e4f72d37791aa5b0e138398f25afcb0', 1, 20),
(30, 'Fernada Galúcio Santana Soares', '01627308296', '', '', 'fsoares', '75e35037baa86ffe2b6592e681bd7b65', 1, 20),
(31, 'Dayane Nascimento', '89418271249', '', '', 'dnascimento', 'fde7d42124df26afcd0f74b2e8637020', 1, 20),
(32, 'Clara de maria Souza do Vale', '00018770207', '', '', 'cvale', '56f6b5dbbfddf32c34d4f57bceabff6b', 1, 9),
(33, 'Leocivania Oliveira', '66091438204', '', '', 'loliveira', 'b73440e7df7b5dcfb25d3058c148eb2e', 1, 9),
(34, 'Conceição Gil Cabral Acordi', '45607699234', '', '', 'cacordi', 'd50695037cc01648b9e37fff643e164c', 1, 9),
(35, 'Ana Paula Ferreira Carvalho', '68222440268', '', '', 'acarvalho', '63f58ae62f177fb9b7157e1705291981', 1, 9),
(36, 'Janaína Barbosa de Oliveira', '51200457234', '', '', 'joliveira', '71ff5f0a066599e7996fe38bf980d943', 1, 9),
(37, 'Andreia Lima de Souza', '79841384272', '', '', 'asouza', '828aeb00ccf8313ab231870c8c0db9e0', 1, 9),
(38, 'Thaisa Correia da Gama', '00020616279', '', '', 'tgama', 'd7e941dcd980d48fa061116223a17cb0', 1, 9),
(39, 'Raphaela dos Santos Mussa', '03112773225', '', '', 'rmussa', '9502bed01037b336f8ba00d52e2eb0d9', 1, 9),
(40, 'jonyslene dos Santos Fernandes', '02204883204', '', '', 'jsfernandes', 'd8c217430d9ef0b730bb38ab0a9f67c3', 1, 9),
(41, 'Thalita Guedes', '61436941253', '', '', 'tguedes', 'e10adc3949ba59abbe56e057f20f883e', 1, 9),
(42, 'Deborah Ewely Batista Pinto', '01627285229', '', '', 'dpinto', '3066ec78c52033df8cfc6bb9ac7d311d', 1, 10),
(43, 'Marco Antonio Lima de Aguiar', '66023360297', '', '', 'maguiar', 'c99f6e1696c94541165d6f85c683ba55', 0, 10),
(44, 'Clíssia Lucas Rodrigues', '01932043209', '', '', 'crodrigues', 'e63f5134cbc524deb481b74c71634d23', 1, 10),
(45, 'Maria Lucilaide Pereira Reges', '29161304204', '', '', 'mreges', '1c11c9e37063ed73cd39f1f25589f4bf', 1, 10),
(46, 'Erlan Mesquita Retroz', '1867800284', '', '', 'eretroz', 'e10adc3949ba59abbe56e057f20f883e', 1, 10),
(47, 'Francisca Gercwolf', '04675894291', '', '', 'fgercwolf', 'b5c7eade9000e2ec4bf1f54549ae495b', 0, 10),
(48, 'Juliano Ferreira Lustosa', '70430667272', '', '', 'jlustosa', '02732976853a920d8c830a66f1559686', 1, 10),
(49, 'Andreson de Sena Fontinele', '99240068287', '', '', 'afontinele', '9a39a739bc91b176c710d6b07f420b6b', 0, 10),
(50, 'Maykon Nogueira', '01128333228', '', '', 'mnogueira', '1c01a90332a55f9ce9ad813727423832', 1, 10),
(51, 'Anne Elisa do Nascimento de Sousa', '31468756249', '', '', 'asousa', '623be3bef60b710dd8be02c1bd43e6a5', 1, 10),
(52, 'Jéssica Mendonça Maciel', '00623262282', '', '', 'jmaciel', 'dd4b7f9aa6e549d64f781a9505b0702b', 1, 10),
(53, 'Luis Alberto Pereira da Silva', '43879110778', '', '', 'lpereira', '9fe810188580d3f93ea0ad18eae89fdf', 1, 10),
(54, 'Pâmela de Fátima de Mendonça Amorim', '2362504263', '', '', 'pamorim', 'cd7661081d57e04bb45140bb6f947a79', 1, 10),
(55, 'Antonia do Perpetuo Socorro Ferreira da Silva', '20203179234', '', '', 'apqueiroz', '8fc40472256559eafe735d9340ac0be0', 1, 10),
(56, 'Nubia Cavalcante', '84154420259', '', '', 'ncavalcante', 'ec23277e081229f770b622285fd6554a', 1, 10),
(57, 'Thiago Barbosa Santos da Costa', '85259357272', '', '', 'tsantos', '4bd0c7714cf73a87ba25471ea441834c', 1, 10),
(58, 'Rosely Fernandes Veras', '16104757200', '', '', 'rveras', 'edbdd401bd8d48f413ef127f0d17915e', 1, 10),
(59, 'Mateus do Nascimento Teixeira', '03665793203', '', '', 'mnteixeira', 'f920070864f6127588afc54a7af31490', 1, 14),
(60, 'Maurício da Silva Lira', '70380342278', '', '', 'mlira', '378d7615cd68ea1f8876cd6268802654', 1, 14),
(61, 'Raica Dameane Bentes Pinto', '86129880200', '', '', 'rpinto', '12a9e870640b62a3a289b54ec78ff3a7', 1, 14),
(62, 'Francimary Monteiro Maia', '29074380263', '', '', 'fmaia', '38339d9c706910264444910d244b3dbf', 1, 14),
(63, 'Thalissa Freire da Rocha', '03330738278', '', '', 'trocha', 'dad494ca46b90dd068c91ce0e2250761', 1, 14),
(64, 'Jaira Souza da Silva', '00561279284', '', '', 'jssouza', 'fc0b6ee244ba7a26b998c327ee6b5464', 1, 14),
(65, 'Gleiciane Pinto da Silva', '63881411291', '', '', 'gsilva', 'bc4eea8a06d33c55b85e5af05ae3cd5d', 1, 14),
(66, 'Wesley Assunção Costa', '00605233284', '', '', 'wcosta', 'd931062e826e1d6b56e345b0af418ac1', 1, 14),
(67, 'Silviane Freitas Campos', '00780835247', '', '', 'scampos', 'ccbad1090e3326b75e97ff13f96df2a9', 1, 14),
(68, 'Priscila Nascimento de Sousa', '01040507212', '', '', 'pnascimento', '6b871a276e72b1d0583f9d7bdf0d7bfd', 1, 14),
(69, 'Gabriela Ramos', '03713426279', '', '', 'gramos', 'a4230b81fb0c7a103eb5824b4fc2992c', 1, 14),
(70, 'Polyana Peixoto Pinheiro', '95836250197', '', '', 'ppinheiro', 'fe98d6b627b9b02e26d75e6298976dd4', 1, 14),
(71, 'Francisca Suely Alencar dos Santos', '23844647287', '', '', 'salencar', 'e10adc3949ba59abbe56e057f20f883e', 1, 14),
(72, 'Liene Maria', '23966190206', '', '', 'lmaria', '713a3ae903f6aab76c2fcfa1006c4b36', 1, 14),
(73, 'Carla de Lima Barbosa Lopes', '56753713204', '', '', 'cbarbosa', '25d9fed238404891fb5bcac2c6c7665c', 1, 14),
(74, 'Mirielle Luna', '61429732253', '', '', 'mvasconcelos', '5a4a2e99d6714533956fb16221b629ce', 1, 14),
(75, 'Marcelo Barroso Naveca', '95690654272', '', '', 'mnaveca', '7206d1af464f880847f04745d8144b38', 1, 3),
(76, 'Jouse Oliveira Parente', '76348210200', '', '', 'jparente', '4aee6f12564f9be4d01b9e2805c7a039', 1, 3),
(77, 'André de Santa Maria Binda', '56420790263', '', '', 'abinda', 'e10adc3949ba59abbe56e057f20f883e', 1, 3),
(78, 'Ivonete Gomes Cabral', '43659896268', '', '', 'icabral', 'b44e1bfce6e2b4644bce0c8993b64421', 1, 3),
(79, 'Rosalia Guilherme Cavalcante', '63023504253', '', '', 'rcavalcante', '2bd9c0ed00116be1258e0cc66617d7c8', 1, 3),
(80, 'Andrielle Melo de França', '03014926205', '', '', 'afrança', '1025b42251c6d5df9b7d86839af67ca1', 1, 3),
(81, 'Jackeline de Souza Nascimento da Silva', '03201401218', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 1, 3),
(82, 'Thais Nascimento de Paula', '00297733265', '', '', 'tpaula', 'de122de13bd235b91a6369cf75b2f3ba', 1, 3),
(83, 'Dean Batista dos Santos', '02816186237', '', '', 'dbsantos', 'dc6f9e3d5dc2888ba35829438d3bf35e', 1, 3),
(84, 'Júlia de Souza Moreira', '00825576245', '', '', 'jmoreira', '04305e8ef1c15dbf249cc0c99ce86107', 1, 3),
(85, 'Maria Dione Costa Carvalho', '58458450259', '', '', 'mcarvalho', '117735823fadae51db091c7d63e60eb0', 1, 3),
(86, 'Gracivânia da Silva Maciel', '31055729291', '', '', 'gmaciel', 'fbfc6bd70ba32f7e4ebfb7bab66dac1f', 1, 8),
(87, 'Ivamar Moreira da Silva', '35948205215', '', '', 'imoreira', '5ee5cc1b0de15a9161930a15cc54cb6d', 1, 8),
(88, 'Semira Moreira Dias', '41800206291', '', '', 'sdias', '9d91e2677788b7ca8eb2d005300deea0', 1, 8),
(89, 'Irlene Arce', '13033921272', '', '', 'iarce', '8f0a7499c016d6747fcc9d298aa28f83', 1, 8),
(90, 'José Roberto Sileno de Souza Filho', '03275458280', '', '', 'jfilho', '2650418edb3ad5b8841053f243b7edde', 1, 8),
(91, 'Lady Paloma Abrantes de Oliveira', '01914915275', '', '', 'labrantes', '2a3c68b83e014ed8f471e6947934b5da', 1, 8),
(92, 'Julianny Carvalho de Oliveira Costa', '01196069255', '', '', 'jcosta', 'e10adc3949ba59abbe56e057f20f883e', 1, 8),
(93, 'Elienai de Souza Nogueira', '31745792287', '', '', 'enogueira', 'e10adc3949ba59abbe56e057f20f883e', 1, 8),
(94, 'Amanda Beatriz Modesto Bulcão', '52738213200', '', '', 'abulcão', '4152a9824483d52143e92691eabac7cf', 1, 8),
(95, 'Neilon Márcio Batista da Silva', '57354502200', '', '', 'nsilva', '1cde1e7600c9020f267859aa27809a60', 1, 8),
(96, 'Luciana Loiola Maciel Souza', '76384616220', '', '', 'lsouza', 'bd4d664183c6617a6075ab559947fc4d', 1, 8),
(97, 'Marne Carvalho de Vasconcellos', '65275390297', '', '', 'mvasconcellos', 'e10adc3949ba59abbe56e057f20f883e', 1, 8),
(98, 'Annie Mara Arruda de Sá e Brito', '41708458204', '', '', 'abrito', 'fc26eb9c88e295c9bbfb2b077fcafa52', 1, 8),
(99, 'Alice Neves Peres', '02198818205', '', '', 'aperes', '1793cc6c1e36facdeb2d09b7fda4e077', 1, 8),
(100, 'Rosangela Pereira Alves Ferreira', '74802976704', '', '', 'rferreira', '82f4f7295d3dcc57745670d2593fc4b1', 1, 8),
(101, 'Daniella Gusmão de Oliveira', '78558999287', '', '', 'dgusmao', '332df8595301404e55f7c1cecc6b0448', 1, 8),
(102, 'Higor Lima Cunha', '04067756216', '', '', 'hcunha', 'ee89eb8e3c9f0b07647a1b4ecad7d815', 1, 8),
(103, 'Camila Castro de Alencar', '00775486205', '', '', 'calencar', '953d250ad8eea52a6b6f6b977bdc54b5', 1, 8),
(104, 'Taina Isolino', '53115120249', '', '', 'tisolino', 'f9eba0be6e36513431ca90b76c8bc1b9', 1, 8),
(105, 'Andreza da Silva Salgado', '84945672253', '', '', 'asalgado', 'be7e32e37d954f40c11cbef15d91e8cd', 1, 8),
(106, 'Auristela dos Santos Conserva', '24034258268', '', '', 'aconserva', '7e8f7cb3aed6758b4e8d316030156396', 1, 8),
(107, 'Suelen  Feleol do Vale', '98685260272', '', '', 'svale', '9303653a31fd6385423a7741bcf3d087', 1, 8),
(108, 'Aline Lauria', '37186736220', '', '', 'alauria', '4bdd6e98c11435b22d6c696c8dbec04d', 1, 4),
(109, 'Jolene Almeida de Souza', '45641684287', '', '', 'jasouza', '19bb6446b3b893cca25e007ec306c7d5', 1, 4),
(110, 'Suzete de Andrade Paiva', '20161239234', '', '', 'spaiva', '68365ac728640fa8b13e6b5c62936064', 1, 4),
(111, 'Edilza Ribeiro Pereira', '23514604215', '', '', 'eribeiro', 'b267692a8bb5ab8d490d77b8ee1e7a7a', 1, 4),
(112, 'Gilcélia Melo Lourido', '57801843215', '', '', 'glourido', 'c76a6faead9eab1e95ab84c846c510b9', 1, 4),
(113, 'Walef Gomes Sousa', '01625165250', '', '', 'wsousa', 'bcd0cf72d8dd4df3b30d8e4cf5fcd405', 1, 4),
(114, 'Lou Saraiva Auger', '62277898287', '', '', 'lauger', '107c3d537cbc2ab01cf8dc90508ccd12', 1, 4),
(115, 'maria analice cassiano de melo', '27400026291', '', '', 'mmelo', 'f525da1bca7b3c086d3c764228be4b8b', 1, 4),
(116, 'Verena Soares', '86198890287', '', '', 'vsoares', 'a805b14a86b8a1df480aff15a5bf2100', 1, 4),
(117, 'mariene marcela rodrigues', '00944585299', '', '', 'mmarcela', 'f7a584a6b09582cd110636ae9a79eaec', 1, 4),
(118, 'Ana Cláudia Maquiné Dutra', '51358115249', '', '', 'cmaquine', 'fa8dfcc804ef1d8782cc762ef8027f7c', 1, 4),
(119, 'Any Gonçalves da Silva', '92237460272', '', '', 'asilva', 'bdad6b5db80e19727362f3d86ba91e87', 1, 5),
(120, 'Kamila Barbosa da Silva', '00858180200', '', '', 'kbarbosa', 'bdc61a8e63ad807733dad189e660f7f8', 1, 5),
(121, 'Melina Macario Freitas de Lima', '94685975200', '', '', 'mmacario', '7fe205b89e8c538514af8ddec6c4f53e', 1, 5),
(122, 'Maria Elisiário', '42710308215', '', '', 'melisiario', '6099e84f9d1befa6b55f0dc652de4899', 1, 5),
(123, 'Bryan Renan Araujo Pinto', '02162283280', '', '', 'bpinto', 'e10adc3949ba59abbe56e057f20f883e', 1, 5),
(124, 'Fabiane Pereira de Melo', '00880036206', '', '', 'fmelo', '557076f52749a378c5ecad132b5317cb', 1, 5),
(125, 'Liene Rocha Picanço Gomes', '71572376287', '', '', 'lrocha', '17a0e614ae3be27cb857a43786bd84dd', 1, 5),
(126, 'Michele Brito', '78199891220', '', '', 'mbrito', 'b38372f31f409ba764cc21f5f6e1633b', 1, 5),
(127, 'Isabelle Clotilde da Cruz Nunes', '01820975282', '', '', 'inunes', 'a44e713392eed2972cd7cc3985334644', 1, 5),
(128, 'Girlanne Amorim Brandão', '00291036228', '', '', 'gbrandao', '7acb92f5874c0c266211b9bd6b5b891d', 1, 5),
(129, 'Michele Hanae Uratani', '74280201234', '', '', 'muratani', '55fae2611e571c2e3859f1427e90f762', 1, 5),
(130, 'Juliana Tavares Mena', '40534855253', '', '', 'jmena', '6b1abb038089c43fc5b0e2524e5db4ec', 1, 5),
(131, 'Geovanna Oliveira de Souza', '03024790233', '', '', 'goliveira', '34b0d436489af707ea9cedbdc3c67031', 1, 5),
(132, 'Khalebe Viana Siqueira Pantoja', '91774152215', '', '', 'kpantoja', 'e10adc3949ba59abbe56e057f20f883e', 1, 5),
(133, 'Maria Dávila Sousa da Silva', '01495648214', '', '', 'mdsilva', '711f107ebfadd66dd1403054f81f9219', 1, 5),
(134, 'Olivia Carolina Moreira Vilaça', '03722556201', '', '', 'ovilaca', '526755706128df19140cf439ddaad6ab', 1, 5),
(135, 'Paulo Victor Gomes Siqueira Guerra', '02137847264', '', '', 'pguerra', 'c061a2b316fc7948d58c3ea806b56a67', 1, 5),
(136, 'David Mayck Vale Assunção', '02767697245', '', '', 'dassunção', '0a5b5fbd1042f8cd02de8cca08310f89', 1, 5),
(137, 'Samantha Valério da Conceição', '02734668289', '', '', 'sconceiçao', '5429f4ed74fc56a10f16620d87dad280', 1, 5),
(138, 'Cintia Xavier Melo', '14716535878', '', '', 'cmelo', 'fb5f2f27be2de104ac2b192f3e874dda', 1, 6),
(139, 'Maria Eduarda da Silva Gomes', '01620250250', '', '', 'megomes', '0f80ccaafcb568f2e2a714edd7f0da9d', 1, 6),
(140, 'Maria Auxiliadora Coelho Pereira', '80082688249', '', '', 'mpereira', 'c213dd3e22eab397b0496ef8c5cff44d', 1, 6),
(141, 'Raquel Maciel de Queiroz', '92581927291', '', '', 'rqueiroz', 'e10adc3949ba59abbe56e057f20f883e', 1, 6),
(142, 'Leonardo da Cruz Moreira', '02123942235', '', '', 'lmoreira', '277ac655eeaddd6fe6d90dd620476008', 1, 6),
(143, 'Jessie Silva', '88612775272', '', '', 'jsilva', '3805b3821c6ae118f6b03e80772c83d5', 1, 6),
(144, 'Ada Lima da Silveira', '94167109204', '', '', 'alima', 'e99a18c428cb38d5f260853678922e03', 1, 6),
(145, 'Wallace Abreu França', '90712579249', '', '', 'wfranca', '48b7d4f1e02c75e0ce50e2b4d0a0063b', 1, 6),
(146, 'Tatiana Lima da SIlva', '19248326234', '', '', 'tlima', '78f4ef7d5b43f268ddcdbdcf85d27513', 1, 6),
(147, 'Esterffany de Sousa Martins', '00826034217', '', '', 'emartins', '4078c7d4dcbad2c4bc771db635160dda', 1, 6),
(148, 'Valéria Costa Silva Farinola', '63816644287', '', '', 'vfarinola', '5fd6711291350c352f3206195d38b816', 1, 6),
(149, 'Caio Alencar Batista', '03422303286', '', '', 'cbatista', '2b46a0457e5c506076003a729cae339b', 1, 6),
(150, 'Lisângela Alves da Costa', '59934050234', '', '', 'lcosta', 'e2711bad0d9a47f3437c746941c83f38', 1, 6),
(151, 'Francisco Chagas dos Santos Neto', '98323083215', '', '', 'fneto', 'ff1d5be8d70605b410b486023ea948e8', 1, 6),
(152, 'Érico Xavier de Souza', '92594875287', '', '', 'exavier', '4b39a27e6098a5a364fe06b8c4d75709', 1, 6),
(153, 'Suellen de sousa Fonseca', '00113974205', '', '', 'sfonseca', 'e10adc3949ba59abbe56e057f20f883e', 1, 6),
(154, 'Verônica Ferreira Gomes', '61597473200', '', '', 'vgomes', '086430800ab6cf94a98c5a7c1508fb8c', 1, 6),
(155, 'Helen Cristina Nascimento de Melo', '51718049234', '', '', 'hmelo', '538de296fa75e120015065feb4f75fdc', 1, 6),
(156, 'Poliana Caren de Oliveira Barbosa', '91152542249', '', '', 'pcaren', 'f83c274fb0036fba9627cacd08cb2ad1', 1, 6),
(157, 'Juliana Ferreira', '87714256249', '', '', 'jferreira', '80871e69d796b9bf889d041ded4c19ac', 1, 7),
(158, 'Danillo Phelip Ferraz Bindá', '70079950205', '', '', 'dbinda', '1fa15033b7c585c603448edb6ee4875f', 1, 7),
(159, 'Danielle Salles Silva', '51947986287', '', '', 'dsalles', '467b617fec4d9fcb63505734ee224851', 1, 7),
(160, 'Irlando Cansanção', '00164524290', '', '', 'icansancao', 'f2e805333c6ac673fa4bb5bd1ac92b95', 1, 7),
(161, 'Kethelen Freitas de Souza', '45590770297', '', '', 'kfreitas', 'cd9389b093498f7be542d7da02dc8b9d', 1, 7),
(162, 'Luis Gustavo Cardoso', '02519078219', '', '', 'lcardoso', '4be4478492ba786fb97b7ca0700a9a78', 1, 2),
(163, 'Darani Fumi Oda', '80085954268', '', '', 'doda', 'd9925de13ac6d3fbb039119ea7846297', 1, 2),
(164, 'ADRIANE BATISTA', '00358913276', '', '', 'abatista', '43f193d9789c81d9752e21a69b2506b5', 1, 2),
(165, 'Vitor Rocha Matos', '02702317227', '', '', 'vmatos', 'ea853a0b1b049efba09968dde2154478', 1, 2),
(166, 'Wagner William Amorim de Andrade', '02588509223', '', '', 'wandrade', 'b236afc9536d237876a43f352c55cff0', 1, 2),
(167, 'Beatriz da Costa Pereira', '03182900226', '', '', 'bcostap', 'da68fc3d3483b0b89bd2103ad6546aff', 1, 1),
(168, 'Augusto Lobato', '71099123291', '', '', 'alobato', '3200d1feb9f30340888c39f9f4d7c28f', 1, 1),
(169, 'Camila Cavalcante da Cunha', '03295783241', '', '', 'ccunha', '0474d0ad664f68315af95070fdc53da8', 1, 1),
(170, 'Ana Dilza Barros de Azevedo', '48206997253', '', '', 'aazevedo', '7461c2f360cb57123663c583eb980218', 1, 1),
(171, 'Tatianne de Alcantara Azulay Mello', '84286458253', '', '', 'tmello', '2124054c713e97062347653d8f550a70', 1, 1),
(172, 'João Victor Alcantara', '70073595233', '', '', 'jamaral', 'e34ae84985ce58aeb7e282927f394e81', 1, 1),
(173, 'Dominik Thayna Tamura de Oliveira', '03498083252', '', '', 'doliveira', '92d623566bb9e0892f5f1e090dcedda1', 1, 1),
(174, 'Filipe Sanches', '86076051272', '', '', 'fsanches', '2c83b5b867c79654959b98ed1f4b45ad', 1, 1),
(175, 'Michelle Vitória Custódio', '63131137215', '', '', 'mcustodio', '1bd3aa6236e3b247383c709408a3973c', 1, 1),
(176, 'Camila Farias Viana', '00298594250', '', '', 'cviana', '4c5932c7edf3a20978ebcf1697221b93', 1, 1),
(177, 'Lucas Victor Gonçalves Assunção', '02759065235', '', '', 'lassuncao', '8a953dca0d000677271c0980261aaa28', 1, 1),
(178, 'Sicy Rusalka Góes de Melo Barreto', '77430298249', '', '', 'smelo', '538de296fa75e120015065feb4f75fdc', 1, 1),
(179, 'Jéssica de Aguiar Alvares', '01282392204', '', '', 'jaguiar', '74f772b9c5cde69a35710fdd8abcdf0a', 1, 1),
(180, 'Thalissa Regina Zacarias Freire', '82230501291', '', '', 'tfreire', '9e486853a04676e42383848cb3a7f444', 1, 1),
(181, 'Carla Garcia de Vasconcellos Silva', '44163150234', '', '', 'cgarcia', '1da996f996b5cece98e8992d9298ed02', 1, 19),
(182, 'Stteice Marjô Froz Costa', '94350310215', '', '', 'sfroz', '45339359513f09155110f63f7ca91c3e', 1, 19),
(183, 'tatiana cristina pinheiro moreira', '01133364209', '', '', 'tpinheiro', '65a3229f589d276e5e486367706cd646', 1, 19),
(184, 'Rachel Mota da Silva', '78947510220', '', '', 'rmota', '0a2235fd7a1480c42615afd1bdfec412', 1, 19),
(185, 'Lilian Rodrigues', '60399538291', '', '', 'lrodrigues', '4c3963ede31942c0aac2a6306c1347d6', 1, 19),
(186, 'Luciana e Santos Campelo Gomes', '00513603220', '', '', 'lgomes', '96c5d8d8151cae779dba517e0bad3ea5', 1, 19),
(187, 'Gabriela Barreto Duarte Seixas', '76728781234', '', '', 'gseixas', '284b45a7cf8d753be459a1f7ddbff8b6', 1, 21),
(188, 'Mário Augusto', '59845970206', '', '', 'msantos', '7fb669e2d3e971439b58fb1dc9b31c20', 1, 21),
(189, 'James Roosevelt da Silva Rodrigues Junior', '70076809250', '', '', 'jjunior', 'c985f8492b45ce36d02d6e1556d4d4da', 1, 21),
(190, 'Christian Souza', '95860649215', '', '', 'csouza', 'c788ca96bcb7ff6837f7f6b164c0fc6e', 1, 21),
(191, 'Roberto dos Santos Silva Filho', '00315306211', '', '', 'rfilho', 'ce80320df4831103fc8238a1a246d126', 1, 21),
(192, 'Elissandro Victor de Lima Falcão', '03156873209', '', '', 'efalcao', '601ae0f31bda33e526d9f320eeec4967', 1, 21),
(193, 'jhonrley william souza silva', '02180483279', '', '', 'jwilliam', 'c6939f0d07006c47fc4594ea5aea3683', 1, 21),
(194, 'Mariete Viana Libório Farias', '64160599249', '', '', 'mfarias', '09b1c458bb315f2168a55ca9cce7f924', 1, 21),
(195, 'Marcélia Torres da Silva Nogueira', '70419094253', '', '', 'mtnogueira', 'ee3c280cbf52cd664b0cb1dd573521ff', 1, 21),
(196, 'Mardson Rios Alencar Junior', '01514218208', '', '', 'malencar', '6bba03e913b6dea46020a44854495cb4', 1, 21),
(197, 'Adonis Filipe Souza silva', '93760663249', '', '', 'afsilva', '0f99ba1a33dc6f07165fd15449da7e77', 1, 21),
(198, 'Thiago de Lima Horta', '79161669253', '', '', 'thorta', '93bee45683a87b7a3e46be6f3c6f1615', 1, 21),
(199, 'Rafael da Silva campos', '90140559272', '', '', 'rcampos', 'd8c8262a4c6f6a7258ac6df8834016f3', 1, 21),
(200, 'Silvana Suelly Noberto Silva Bezerra', '01927344409', '', '', 'sbezerra', 'e80be10bbabb2d4c358a1f15ad278a34', 1, 30),
(201, 'Bianca Carolina Paes de Abreu', '03363530226', '', '', 'babreu', '3306fcfc7e5ae9427353df18f26019fc', 1, 22),
(202, 'Adriana Vale de Freitas', '50804030200', '', '', 'afreitas', '7967756da74ed13f9a45291b57b9a1f2', 1, 22),
(203, 'Pietra Ranih Azevedo de Oliveira', '00247067288', '', '', 'poliveira', '5174a64cee1960d297468efe3a53e88d', 1, 22),
(204, 'Marcelo Araújo SIlva', '75899175249', '', '', 'maraujo', '462802faaf5348e4d8bb9f3c7f2058fd', 1, 16),
(205, 'Raimunda Serra do Nascimento', '00285176285', '', '', 'rserra', '138c4af8611983bf6ea57355cb8c11ce', 1, 16),
(206, 'Ana Mirza Viana', '24045810234', '', '', 'amirza', '32c988918fc9826b0587c16bab42a827', 1, 16),
(207, 'Paula Vivian Araújo Paulain', '00953690237', '', '', 'ppaulain', '2fce68ff03d74864c67db807fcbf9f77', 1, 18),
(208, 'ana carolina monteiro penz', '52264149272', '', '', 'apenz', 'e10adc3949ba59abbe56e057f20f883e', 1, 18),
(209, 'Cintia Nascimento de Souza', '02017847267', '', '', 'cnascimento', 'ec195e7be7448c6390b03eacdbc20115', 1, 18),
(210, 'Danielle Barroncas Lima', '51242087249', '', '', 'dlima', 'b6c321e9036a46dfd2d281898e605e9c', 1, 18),
(211, 'Jeferson de Andrade Pedrosa', '72034238249', '', '', 'jpedrosa', 'b7eea76c6a803c36b061e2aaba271351', 1, 18),
(212, 'Bruna Rafaelle Barbosa Freitas', '00089627237', '', '', 'bfreitas', '1193090bee838e883d7b290a8b872136', 1, 18),
(213, 'Maria Alcilene Gama Balieiro', '63892103291', '', '', 'mbalieiro', 'acca173b627dade82cd3ebaa58af0802', 1, 13),
(214, 'André Romero de Oliveira', '56944616220', '', '', 'aroliveira', 'e10adc3949ba59abbe56e057f20f883e', 1, 13),
(215, 'Karen Vilany', '90876733291', '', '', 'kvilany', '86848b9dcf13837f3e319661da84f5a7', 1, 13),
(216, 'knef Santana Reis', '01588204286', '', '', 'kreis', 'b4c58421c2f21fa334a82d9a360082d0', 1, 29),
(217, 'Cátia Regina da Silva', '47333472272', '', '', 'csilva', 'a8d3399a60f3fde72d34f4877c128398', 1, 29),
(218, 'Jorge Araujo da Costa', '21473498287', '', '', 'jaraujo', 'f2e830664053d22f2d26d9abd2f662dc', 1, 29),
(219, 'Karol Aline de Oliveira Sobral', '01143347226', '', '', 'ksobral', '9f9fb9cfaa77ed6a9c63dcd855533d1f', 1, 29),
(220, 'Angra Micaela Torres do Nascimento', '88879534220', '', '', 'atorres', 'd1394d6a348f391fcecdcf47a18b9910', 1, 29),
(221, 'Silvia Regina Santos Albuquerque', '64835782291', '', '', 'salbuquerque', '231cf5b2ae5c541c564a0267143f0c9d', 1, 29),
(222, 'Beatriz Belém de Freitas', '00301970238', '', '', 'bbelem', '847af2d4a7ca241fa28332e002b32081', 1, 29),
(223, 'Thaís Borges Viana', '51191466272', '', '', 'tviana', 'e10adc3949ba59abbe56e057f20f883e', 1, 31),
(224, 'Liliane dos Santos Valente', '00874076200', '', '', 'lvalente', 'b695b964cf5ea51a8752775bfa63be6d', 1, 31),
(225, 'Fabricio Luiz Pascoal Porto', '00237661233', '', '', 'fporto', '82a63f5df8ac03fe2d5f6e2a0bc52fb9', 1, 17),
(226, 'Giomar Ramos Mirandola', '38938324249', '', '', 'gmirandola', '91eb2ad224e4f35082100958cf9a75fe', 1, 17),
(230, 'Usuário Teste', '37014475002', 'usuarioteste@teste.com', 'profile1.png', 'uteste', 'e10adc3949ba59abbe56e057f20f883e', 1, 12),
(231, 'Sara Daiana Vieira Cardoso', '70199162280', 'saradaia252@gmail.com', 'profile1.png', 'scardoso', 'e10adc3949ba59abbe56e057f20f883e', 1, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculo`
--

CREATE TABLE `tb_veiculo` (
  `id_veiculo_pk` int(11) NOT NULL,
  `modelo_vcl` varchar(150) DEFAULT NULL,
  `ano_modelo_vcl` int(11) DEFAULT NULL,
  `ano_fabrica_vcl` int(11) DEFAULT NULL,
  `renavam_vcl` varchar(20) DEFAULT NULL,
  `placa_vcl` varchar(10) DEFAULT NULL,
  `ultimo_km_vcl` int(11) DEFAULT NULL,
  `dt_licenca_vcl` date DEFAULT NULL,
  `img_vcl` varchar(150) DEFAULT NULL,
  `status_vcl` tinyint(1) DEFAULT NULL,
  `id_tp_prop_fk` int(11) NOT NULL,
  `id_fabricante_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_veiculo`
--

INSERT INTO `tb_veiculo` (`id_veiculo_pk`, `modelo_vcl`, `ano_modelo_vcl`, `ano_fabrica_vcl`, `renavam_vcl`, `placa_vcl`, `ultimo_km_vcl`, `dt_licenca_vcl`, `img_vcl`, `status_vcl`, `id_tp_prop_fk`, `id_fabricante_fk`) VALUES
(1, 'L200, GLS, Mod. K34TF6, Cabine dupla', 2005, 2005, '00000000000', 'JXG-6628', NULL, '2005-08-01', 'carro_padrao.png', 0, 2, 12),
(2, 'Moto', 2005, 2005, '00000000001', 'OAD-9174', NULL, '2021-05-01', 'carro_padrao.png', 1, 1, 8),
(3, 'Uno', 2005, 2005, '00000000002', 'PHN-4010', NULL, '2005-05-01', 'carro_padrao.png', 0, 2, 6),
(4, 'Corsa classic sedan 1.6HP', 2006, 2006, '00000000003', 'JXU-7638', NULL, '2006-08-01', 'carro_padrao.png', 0, 2, 4),
(5, 'Doblo, ELX 1.8, 4P', 2006, 2006, '00000000004', 'JXS-4008', NULL, '2006-08-01', 'carro_padrao.png', 0, 2, 6),
(6, 'Gol 1.0 city - 4P', 2006, 2006, '00000000005', 'JXG-5666', NULL, '2006-06-01', 'carro_padrao.png', 0, 2, 18),
(7, 'S10 RODEIO 2.8 D', 2010, 2010, '00000000006', 'NOS-7926', NULL, '2010-06-01', 'carro_padrao.png', 0, 2, 4),
(8, '408 Allure', 2011, 2011, '00000000007', 'OAE-5447', NULL, '1969-12-31', 'carro_padrao.png', 0, 2, 14),
(9, 'Gol 1.0', 2011, 2011, '00000000008', 'OAI-2120', NULL, '2011-10-01', 'carro_padrao.png', 0, 2, 18),
(10, 'MMC/L200 Outdoor', 2011, 2011, '00000000009', 'OAB-9687', NULL, '2011-07-01', 'carro_padrao.png', 0, 2, 12),
(11, 'CG  125', 2012, 2012, '00000000010', 'OAA-1825', NULL, '2012-05-01', 'carro_padrao.png', 0, 2, 8),
(12, 'Etios HB X', 2013, 2013, '00000000011', 'OAI-7893', NULL, '2013-03-01', 'carro_padrao.png', 0, 2, 16),
(13, 'Etios SD X', 2013, 2013, '00000000012', 'OAI-7813', NULL, '2013-03-01', 'carro_padrao.png', 0, 2, 16),
(14, 'Frontier S 4x4', 2013, 2013, '00000000013', 'OAJ-0194', NULL, '2013-04-01', 'carro_padrao.png', 0, 2, 13),
(15, 'Novo Gol 1.0 City', 2013, 2013, '00000000014', 'NPA-5674', NULL, '2013-04-01', 'carro_padrao.png', 0, 2, 18),
(16, 'GOL', 2018, 2018, '00000000015', 'PHO9068', NULL, '2018-08-01', 'carro_padrao.png', 1, 2, 18),
(17, 'Prisma', 2018, 2018, '00000000016', 'OXM-4070', NULL, '2018-10-01', 'carro_padrao.png', 1, 2, 4),
(18, 'Onix', 2019, 2019, '00000000017', 'PHS-3B86', NULL, '2021-07-01', 'carro_padrao.png', 1, 2, 4),
(19, 'Onix', 2019, 2019, '00000000018', 'PHU-5G77', NULL, '2020-07-01', 'img_phu5g77.png', 1, 2, 4),
(20, 'Onix Joy', 2019, 2019, '00000000019', 'PHU-6D27', NULL, '2019-07-01', 'carro_padrao.png', 0, 2, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_abastecimento`
--
ALTER TABLE `tb_abastecimento`
  ADD PRIMARY KEY (`id_abastece_pk`),
  ADD KEY `fk_tb_abastecimento_tb_motorista1_idx` (`id_motorista_fk`),
  ADD KEY `fk_tb_abastecimento_tb_veiculo1_idx` (`id_veiculo_fk`),
  ADD KEY `fk_tb_abastecimento_tb_combustivel1_idx` (`id_combustivel_fk`);

--
-- Índices para tabela `tb_combustivel`
--
ALTER TABLE `tb_combustivel`
  ADD PRIMARY KEY (`id_combustivel_pk`);

--
-- Índices para tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id_fabricante_pk`);

--
-- Índices para tabela `tb_motorista`
--
ALTER TABLE `tb_motorista`
  ADD PRIMARY KEY (`id_motorista_pk`);

--
-- Índices para tabela `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD PRIMARY KEY (`id_perfil_pk`);

--
-- Índices para tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD PRIMARY KEY (`id_servico_pk`),
  ADD KEY `fk_tb_servico_tb_tipos_servico1_idx` (`id_tp_servico_fk`),
  ADD KEY `fk_tb_servico_tb_veiculo1_idx` (`id_veiculo_fk`);

--
-- Índices para tabela `tb_setor`
--
ALTER TABLE `tb_setor`
  ADD PRIMARY KEY (`id_setor_pk`);

--
-- Índices para tabela `tb_solicitacao`
--
ALTER TABLE `tb_solicitacao`
  ADD PRIMARY KEY (`id_solicita_pk`),
  ADD KEY `fk_tb_solicitacao_tb_motorista1_idx` (`id_motorista_fk`),
  ADD KEY `fk_tb_solicitacao_tb_veiculo1_idx` (`id_veiculo_fk`),
  ADD KEY `fk_tb_solicitacao_tb_usuario1_idx` (`id_usuario_fk`),
  ADD KEY `fk_tb_solicitacao_tb_status_solicitacao1_idx` (`id_status_sol_fk`);

--
-- Índices para tabela `tb_status_solicitacao`
--
ALTER TABLE `tb_status_solicitacao`
  ADD PRIMARY KEY (`id_status_sol_pk`);

--
-- Índices para tabela `tb_tipos_servico`
--
ALTER TABLE `tb_tipos_servico`
  ADD PRIMARY KEY (`id_tp_servico_pk`);

--
-- Índices para tabela `tb_tipo_proprietario`
--
ALTER TABLE `tb_tipo_proprietario`
  ADD PRIMARY KEY (`id_tp_prop_pk`);

--
-- Índices para tabela `tb_usr_prf`
--
ALTER TABLE `tb_usr_prf`
  ADD PRIMARY KEY (`id_usr_prf`),
  ADD KEY `fk_tb_usr_prf_tb_usuario1_idx` (`id_usuario_fk`),
  ADD KEY `fk_tb_usr_prf_tb_perfil1_idx` (`id_perfil_fk`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario_pk`),
  ADD KEY `fk_tb_usuario_tb_setor_idx` (`id_setor_fk`);

--
-- Índices para tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD PRIMARY KEY (`id_veiculo_pk`),
  ADD KEY `fk_tb_veiculo_tb_tipo_proprietario1_idx` (`id_tp_prop_fk`),
  ADD KEY `fk_tb_veiculo_tb_fabricante1_idx` (`id_fabricante_fk`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_abastecimento`
--
ALTER TABLE `tb_abastecimento`
  MODIFY `id_abastece_pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_combustivel`
--
ALTER TABLE `tb_combustivel`
  MODIFY `id_combustivel_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  MODIFY `id_fabricante_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_motorista`
--
ALTER TABLE `tb_motorista`
  MODIFY `id_motorista_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_perfil`
--
ALTER TABLE `tb_perfil`
  MODIFY `id_perfil_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  MODIFY `id_servico_pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_setor`
--
ALTER TABLE `tb_setor`
  MODIFY `id_setor_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `tb_solicitacao`
--
ALTER TABLE `tb_solicitacao`
  MODIFY `id_solicita_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `tb_status_solicitacao`
--
ALTER TABLE `tb_status_solicitacao`
  MODIFY `id_status_sol_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_tipos_servico`
--
ALTER TABLE `tb_tipos_servico`
  MODIFY `id_tp_servico_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_tipo_proprietario`
--
ALTER TABLE `tb_tipo_proprietario`
  MODIFY `id_tp_prop_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_usr_prf`
--
ALTER TABLE `tb_usr_prf`
  MODIFY `id_usr_prf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  MODIFY `id_veiculo_pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_abastecimento`
--
ALTER TABLE `tb_abastecimento`
  ADD CONSTRAINT `fk_tb_abastecimento_tb_combustivel1` FOREIGN KEY (`id_combustivel_fk`) REFERENCES `tb_combustivel` (`id_combustivel_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_abastecimento_tb_motorista1` FOREIGN KEY (`id_motorista_fk`) REFERENCES `tb_motorista` (`id_motorista_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_abastecimento_tb_veiculo1` FOREIGN KEY (`id_veiculo_fk`) REFERENCES `tb_veiculo` (`id_veiculo_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD CONSTRAINT `fk_tb_servico_tb_tipos_servico1` FOREIGN KEY (`id_tp_servico_fk`) REFERENCES `tb_tipos_servico` (`id_tp_servico_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_servico_tb_veiculo1` FOREIGN KEY (`id_veiculo_fk`) REFERENCES `tb_veiculo` (`id_veiculo_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_solicitacao`
--
ALTER TABLE `tb_solicitacao`
  ADD CONSTRAINT `fk_tb_solicitacao_tb_motorista1` FOREIGN KEY (`id_motorista_fk`) REFERENCES `tb_motorista` (`id_motorista_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_solicitacao_tb_status_solicitacao1` FOREIGN KEY (`id_status_sol_fk`) REFERENCES `tb_status_solicitacao` (`id_status_sol_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_solicitacao_tb_usuario1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `tb_usuario` (`id_usuario_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_solicitacao_tb_veiculo1` FOREIGN KEY (`id_veiculo_fk`) REFERENCES `tb_veiculo` (`id_veiculo_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_usr_prf`
--
ALTER TABLE `tb_usr_prf`
  ADD CONSTRAINT `fk_tb_usr_prf_tb_perfil1` FOREIGN KEY (`id_perfil_fk`) REFERENCES `tb_perfil` (`id_perfil_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_usr_prf_tb_usuario1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `tb_usuario` (`id_usuario_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `fk_tb_usuario_tb_setor` FOREIGN KEY (`id_setor_fk`) REFERENCES `tb_setor` (`id_setor_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD CONSTRAINT `fk_tb_veiculo_tb_fabricante1` FOREIGN KEY (`id_fabricante_fk`) REFERENCES `tb_fabricante` (`id_fabricante_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_veiculo_tb_tipo_proprietario1` FOREIGN KEY (`id_tp_prop_fk`) REFERENCES `tb_tipo_proprietario` (`id_tp_prop_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
