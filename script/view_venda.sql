CREATE or alter view VIEW_VENDA (CODCLIENTE, NOMECLIENTE, RAZAOSOCIAL, CIDADE, UF, CODPRODUTO, PRODUTO, DESCPRODUTO, 
  QTDE, PRECO_BRUTO, DESCONTO, PRECO_LIQUIDO,  VALORVENDA,   
  CODCCUSTO, NOMECCUSTO, CODVENDEDOR, NOMEVENDEDOR, TIPOPRODUTO, CODMOVIMENTO, CODDETALHE, CODVENDA, 
  DATAMOVIMENTO, DATAVENDA, NOTAFISCAL, CODPRO, COD_CAIXA)
AS
  SELECT v.CODCLIENTE, c.NOMECLIENTE, c.RAZAOSOCIAL, ec.CIDADE, ec.UF, md.CODPRODUTO, prod.PRODUTO, md.DESCPRODUTO, 
    SUM(md.QUANTIDADE), md.PRECO as PRECO_BRUTO, SUM(case when md.qtde_alt = 0 then 0 else (md.PRECO*(md.qtde_alt/100))  end) AS DESCONTO, 
    SUM(md.VLR_BASE) AS PRECO_LIQUIDO, SUM(md.VLR_BASE * md.QUANTIDADE) AS VALORVENDA,  
    v.CODCCUSTO, pl.NOME, v.CODVENDEDOR, usu.NOMEUSUARIO, prod.TIPO, mov.CODMOVIMENTO, md.CODDETALHE, v.CODVENDA,
    mov.DATAMOVIMENTO, v.DATAVENDA, v.NOTAFISCAL, prod.CODPRO, mov.COD_VEICULO        
     FROM MOVIMENTO mov 
       inner join MOVIMENTODETALHE md on md.CODMOVIMENTO = mov.CODMOVIMENTO
       inner join VENDA v on v.CODMOVIMENTO = mov.CODMOVIMENTO
       inner join CLIENTES c on c.CODCLIENTE = v.CODCLIENTE 
       left outer join ENDERECOCLIENTE ec on ec.CODCLIENTE = v.CODCLIENTE  and ec.TIPOEND = 0  
       inner join PRODUTOS prod on prod.CODPRODUTO = md.CODPRODUTO 
       left outer join PLANO pl on pl.CODIGO = v.CODCCUSTO
       left outer join USUARIO usu on usu.CODUSUARIO = v.CODVENDEDOR
     where  (mov.codnatureza = 3) 
     group by v.CODCLIENTE, c.NOMECLIENTE, c.RAZAOSOCIAL, ec.CIDADE, ec.UF, md.CODPRODUTO, prod.PRODUTO, md.DESCPRODUTO, 
     v.CODCCUSTO, pl.NOME, v.CODVENDEDOR, usu.NOMEUSUARIO, prod.TIPO, mov.CODMOVIMENTO, md.CODDETALHE, v.CODVENDA,
    mov.DATAMOVIMENTO, v.DATAVENDA  , md.PRECO, v.NOTAFISCAL, prod.CODPRO, mov.COD_VEICULO 
          
        
