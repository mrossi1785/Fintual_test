CREATE TABLE Stock
(
  codigo    VARCHAR2(64 BYTE),
  stock     NUMBER,
  price     NUMBER(10,2)
);

CREATE UNIQUE INDEX PK_STOCK ON STOCK
(CODIGO);


CREATE TABLE Stock_hist
(
  codigo    VARCHAR2(64 BYTE),
  stock_old     NUMBER,
  price_old     NUMBER(10,2), 
  fecha      date
);
