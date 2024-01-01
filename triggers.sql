CREATE OR REPLACE TRIGGER GTM_ORDER_MTO_TR
BEFORE INSERT ON XX_GTM_ORDER_MTO
FOR EACH ROW
  BEGIN
    SELECT GLOBAL_COPS_MTO.NEXTVAL
    INTO :NEW.ORDER_ID
    FROM DUAL;
  END;
