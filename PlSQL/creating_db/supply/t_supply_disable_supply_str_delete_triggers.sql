CREATE OR REPLACE TRIGGER t_supply_disable_supply_str_delete_triggers
BEFORE DELETE ON t_supply
FOR EACH ROW
FOLLOWS t_supply_state_restriction_delete 
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   EXECUTE IMMEDIATE 'ALTER TRIGGER t_supply_str_state_restriction_delete DISABLE';
   EXECUTE IMMEDIATE 'ALTER TRIGGER t_supply_fill_summa_nds_delete DISABLE';   
END;
/
