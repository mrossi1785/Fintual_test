CREATE OR REPLACE PACKAGE BODY portfolio AS



procedure Upd_stock(p_codigo Stock.codigo%type, p_Stock Stock.stock%type, p_price Stock.price%type ) is
    v_exis number;
Begin 
    
    select count(*)
    into v_exis 
    from stock 
    where codigo = p_codigo; 
    
    if v_exis > 0 Then 
        update stock
        set stock = p_Stock,
            price = p_price
        where codigo = p_codigo; 
    Else 
        insert into stock(codigo, stock, price)
        values (p_codigo, p_Stock, p_price ); 
    
    End If; 
    
    commit; 
    
Exception 
    When Others Then 
        rollback; 
        DBMS_OUTPUT.PUT_LINE('Err:'||sqlerrm);
End;  

procedure Re_balance(p_codigo Stock.codigo%type, p_percent number) is 
    
    v_stock  stock%rowtype; 
    v_total number; 
    v_target number;
    v_diff number;  
Begin 

    DBMS_OUTPUT.PUT_LINE('--- Balance Stock ---');
    
    select *
    into v_stock 
    from stock 
    where codigo = p_codigo; 
    
    v_total :=  (v_stock.stock * v_stock.price);
    
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    
    v_target := v_total * p_percent;
    
    v_diff := (v_target - v_total);
                    
    IF v_diff > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Comprar ' || p_codigo || ' valor $' || ROUND(v_diff,2));
    ELSIF v_diff < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Vender ' || p_codigo || ' valor $' || ROUND(ABS(v_diff),2));
    ELSE
        DBMS_OUTPUT.PUT_LINE(p_codigo || ' sin cambios.');
    END IF;
    
Exception 
    When Others Then 
        rollback; 
        DBMS_OUTPUT.PUT_LINE('Err:'||sqlerrm);
End;  

 















END portfolio;