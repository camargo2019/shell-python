-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 20/04/2020 às 17:12
-- Versão do servidor: 5.6.47
-- Versão do PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tpl_user`
--

CREATE TABLE IF NOT EXISTS `tpl_user` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `senha` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tpl_user`
--

INSERT INTO `tpl_user` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Gabriel Camargo', 'gabrielcmr2019@gmail.com', '11212424');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tpl_vps`
--

CREATE TABLE IF NOT EXISTS `tpl_vps` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `usuario` text NOT NULL,
  `senha` text NOT NULL,
  `porta_ssh` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tpl_vps`
--

INSERT INTO `tpl_vps` (`id`, `ip`, `usuario`, `senha`, `porta_ssh`) VALUES
(1, '51.79.71.129', 'root', 'teste', '22');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tpl_user`
--
ALTER TABLE `tpl_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tpl_vps`
--
ALTER TABLE `tpl_vps`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tpl_user`
--
ALTER TABLE `tpl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `tpl_vps`
--
ALTER TABLE `tpl_vps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
