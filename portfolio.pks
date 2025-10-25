CREATE OR REPLACE PACKAGE portfolio AS

procedure Upd_stock(p_codigo Stock.codigo%type, p_Stock Stock.stock%type , p_price Stock.price%type ); 

procedure Re_balance(p_codigo Stock.codigo%type, p_percent number);

END portfolio;