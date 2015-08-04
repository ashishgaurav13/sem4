SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS (SELECT * FROM PRODUCT_MASTER);
BEGIN
  FOR X IN C
  LOOP
    DBMS_OUTPUT.PUT_LINE('CURR IS ' || X.PRODNAME);
    IF (REORDER_NOW(X.CURRQUANTITY, X.MAXQUANTITY, X.LASTORDERDATE) = 1) THEN
      INSERT INTO REORDER_MASTER VALUES (X.PRODNAME, SYSDATE, X.CURRQUANTITY);
      DBMS_OUTPUT.PUT_LINE('DOING FOR ' || X.PRODNAME);
    END IF;
  END LOOP;
END;