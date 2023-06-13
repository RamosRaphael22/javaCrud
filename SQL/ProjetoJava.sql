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

INSERT INTO usuario
VALUES (1, 'raphael');

INSERT INTO historico
VALUES (1, 1, '1+1');

SELECT *
FROM usuario
INNER JOIN historico ON usuario.UserID = historico.UserID;



