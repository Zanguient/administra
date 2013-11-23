SET TERM ^ ;

/* Altero as Trigger primeiro de COMPRA E VENDA, pois, estas não deixaão excluir */

/*create generator gen_cli_end^ 
*/
SET GENERATOR GEN_COD_COMPRA TO 0^
SET GENERATOR COD_AREC TO 0^
SET GENERATOR GEN_COD_PAGAMENTO TO 0^
SET GENERATOR GEN_CONTAB_AUTOINC TO 0^
SET GENERATOR COD_MOV_RATEIO TO 0^
SET GENERATOR GEN_COD_CATEGORIA TO 0^
SET GENERATOR GEN_COD_FAMILIA TO 0^
SET GENERATOR GEN_PLANO_C TO 100^
SET GENERATOR GEN_CODIGOS TO 0^
SET GENERATOR GEN_PROD TO 0^
SET GENERATOR GEN_USO TO 0^
SET GENERATOR GEN_MOV_DET_SERV TO 0^
SET GENERATOR GEN_ITENS_NF TO 0^
SET GENERATOR GEN_CHEQ_BOL_DUPL TO 0^
SET GENERATOR GEN_END_CLI TO 0^
SET GENERATOR GENMOVDET TO 0^
SET GENERATOR GENMOV TO 0^
SET GENERATOR GENVENDA TO 0^
SET GENERATOR GENORCAMENTO TO 0^
SET GENERATOR GEN_CLI TO 0^
--SET GENERATOR GEN_CLI_END TO 0^
SET GENERATOR GEN_COD_FUNC TO 0^
SET GENERATOR GEN_FOR TO 0^
SET GENERATOR GEN_FOR_END TO 0^
SET GENERATOR GEN_NF TO 0^
SET GENERATOR GEN_NF_SERV TO 0^
SET GENERATOR GEN_USER TO 0^

ALTER TRIGGER APAGA_ESTOQUE INACTIVE^
ALTER TRIGGER PROIBE_EXCLUSAO_REC INACTIVE^ 
ALTER TRIGGER PROIBE_EXCLUSAO_PAG INACTIVE^ 
ALTER TRIGGER INSERE_ESTOQUE INACTIVE^ 
ALTER TRIGGER PROIBE_EXCLUSAO_REC INACTIVE^ 
ALTER TRIGGER RETORNA_ESTOQUEVENDA INACTIVE^
ALTER TRIGGER RETORNAESTOQUECOMPRA INACTIVE^
ALTER TRIGGER CAIXAFECHADO INACTIVE^
ALTER TRIGGER CAIXAFECHADORECEBIMENTO INACTIVE^
ALTER TRIGGER CAIXAFECHADOPAG INACTIVE^
ALTER TRIGGER CAIXAFECHADOCONTABIL INACTIVE^

/*Zerando tabela informativo */
UPDATE INFORMATIVO SET 
  CODMOVIMENTO = 0,
  CODDETALHE = 0,
  CODVENDA = 0,
  CODRECEBIMENTO = 0,
  COD_CHEQ_BOL = 0^

/*ALTER TRIGGER APAGA_PAG INACTIVE^*/
/*ALTER TRIGGER APAGA_CONTABIL INACTIVE^*/
ALTER TRIGGER EXCLUI_PAG INACTIVE^
ALTER TRIGGER APAGA_REC INACTIVE^
ALTER TRIGGER PROIBE_ALT_DEL_NF INACTIVE^

commit ^

DELETE FROM CAIXAFECHAMENTO^
DELETE FROM ORCAMENTO^
DELETE FROM AGENDAMENTO^
DELETE FROM VENDA ^
DELETE FROM COMPRA ^
DELETE FROM ENDERECOFORNECEDOR^
DELETE FROM FUNCIONARIO^
DELETE FROM notafiscal^
DELETE FROM TRANSPORTADORA^
DELETE FROM LISTAPRECO_VENDA^
DELETE FROM LISTAPRECO_VENDADET^
DELETE FROM materia_prima^


COMMIT^

delete from IBE$LOG_BLOB_FIELDS^
delete from IBE$LOG_FIELDS^
delete from IBE$LOG_KEYS^
delete from IBE$LOG_TABLES ^
delete from estoquemes^

DELETE FROM RECEBIMENTO^
DELETE FROM PAGAMENTO^
DELETE FROM CAIXA_CONTROLE^

DELETE FROM MOVIMENTO^
DELETE FROM LOGS^
DELETE FROM MOVIMENTOCONT^
DELETE FROM MOV_RATEIO^
DELETE FROM CHEQ_BOLETOS_DUPL^
/*
DELETE FROM PARAMETRO WHERE PARAMETRO = 'NATUREZAENTRADA'^
DELETE FROM PARAMETRO WHERE PARAMETRO = 'NATUREZASAIDA'^
*/
/* Para Teste não precisa limpar estas tabelas*/

/*Zerando tabela informativo */

UPDATE INFORMATIVO SET 
  CODCLIENTE = 0,
  CODFORNECEDOR = 0^
DELETE FROM CLIENTES where codcliente > 0^
DELETE FROM ENDERECOCLIENTE^
DELETE FROM FORNECEDOR where codfornecedor > 0^
DELETE FROM PRODUTOS ^
DELETE FROM CATEGORIAPRODUTO^
DELETE FROM FAMILIAPRODUTOS^
DELETE FROM MARCA^
DELETE FROM PLANO WHERE CODIGO > 58^
DELETE FROM ESTADO_ICMS^
DELETE FROM HISTORICO_CONTAB^
DELETE FROM MOVIMENTONF^
DELETE FROM NOTAFISCAL_SERV^
DELETE FROM ORCAMENTO_TIPOS^
DELETE FROM ORCAMENTO^
DELETE FROM USUARIO WHERE CODUSUARIO > 1^
DELETE FROM CODIGOS ^
DELETE FROM ESTOQUE^
DELETE FROM CHG^
DELETE FROM PROD_CHG^
DELETE FROM LISTAPRECO^
delete from email_enviar^
delete from estoqueccusto^ 
delete from faixa_etaria^
delete from inventario^
delete from os_det^
delete from os^
COMMIT^

DELETE FROM UCTABRIGHTS^
DELETE FROM UCTABUSERS^
DELETE FROM UCTABHISTORY^
DELETE FROM UCTABUSERSLOGGED^


COMMIT^

/*Voltando as Trigger */
/* ALTER TRIGGER APAGA_PAG ACTIVE^*/
/*ALTER TRIGGER APAGA_CONTABIL ACTIVE^*/
ALTER TRIGGER EXCLUI_PAG ACTIVE^
ALTER TRIGGER APAGA_REC ACTIVE^
ALTER TRIGGER APAGA_ESTOQUE ACTIVE^

ALTER TRIGGER PROIBE_EXCLUSAO_REC ACTIVE^ 
ALTER TRIGGER PROIBE_EXCLUSAO_PAG ACTIVE^ 
ALTER TRIGGER INSERE_ESTOQUE ACTIVE^ 
ALTER TRIGGER PROIBE_EXCLUSAO_REC ACTIVE^ 
ALTER TRIGGER RETORNA_ESTOQUEVENDA ACTIVE^
ALTER TRIGGER RETORNAESTOQUECOMPRA ACTIVE^
ALTER TRIGGER CAIXAFECHADO ACTIVE^
ALTER TRIGGER CAIXAFECHADORECEBIMENTO ACTIVE^
ALTER TRIGGER CAIXAFECHADOPAG ACTIVE^
ALTER TRIGGER CAIXAFECHADOCONTABIL ACTIVE^
ALTER TRIGGER PROIBE_ALT_DEL_NF ACTIVE^

commit^

/* - - - - - - - - - - - - - - - -
List of possible problems detected
 - - - - - - - - - - - - - - - - -
None
- - - - - - - - - - - - - - - - */
SET TERM ; ^
