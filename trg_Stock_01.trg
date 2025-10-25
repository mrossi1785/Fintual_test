CREATE OR REPLACE TRIGGER trg_Stock_01 
AFTER UPDATE ON Stock
FOR EACH ROW
    
DECLARE
  v_stock_h Stock_hist%rowtype;
BEGIN
  -- trigger code
  v_stock_h.codigo  := :Old.codigo;
  v_stock_h.stock_old   := :Old.stock;
  v_stock_h.price_old   := :Old.price;
  v_stock_h.fecha := sysdate; 
  
  insert into Stock_hist values v_stock_h; 
  
Exception 
    When Others Then 
        rollback; 
        DBMS_OUTPUT.PUT_LINE('Err:'||sqlerrm);
END;