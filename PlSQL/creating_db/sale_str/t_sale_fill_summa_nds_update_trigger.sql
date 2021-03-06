-- trigger to update 'summa' and 'nds' fields in sale when updating sale string

CREATE OR REPLACE TRIGGER t_sale_fill_summa_nds_update
AFTER UPDATE ON t_sale_str 
FOR EACH ROW
FOLLOWS t_sale_str_autocomplete_restriction_update
WHEN (OLD.summa != NEW.summa OR OLD.id_sale != NEW.id_sale )  
BEGIN
   UPDATE 
      t_sale
   SET 
      summa = NVL(summa, 0) + :new.summa,
      nds = NVL(nds, 0) + :new.nds
   WHERE 
      id_sale = :new.id_sale;
   UPDATE 
      t_sale
   SET 
      summa = summa - :old.summa,
      nds = nds - :old.nds
   WHERE 
      id_sale = :old.id_sale;
END;
/
