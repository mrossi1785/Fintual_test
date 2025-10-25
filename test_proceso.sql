DECLARE
   dummy NUMBER;
BEGIN
    portfolio.Upd_stock('META', 10, 400);
    portfolio.Upd_stock('AAPL', 10, 180);
    
    portfolio.Re_balance('META', 0.4);
    portfolio.Re_balance('AAPL', 0.6);
    
END;