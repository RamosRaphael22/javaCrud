create database dbRaphael;

use dbRaphael;

create TABLE usuario (
    UserID int,
    NomeDeUsuario varchar(255)
);

create TABLE historico (
    UserID int,
    IDHistorico int,
	Operacoes varchar(255)
);