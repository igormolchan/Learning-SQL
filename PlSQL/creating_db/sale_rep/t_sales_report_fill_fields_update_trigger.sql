-- trigger to fill fields in t_sale_rep on insert in this table

CREATE OR REPLACE TRIGGER t_sales_report_fill_fields_update
FOR UPDATE ON t_sale_rep
COMPOUND TRIGGER
   TYPE outData IS RECORD (
      id_ware t_sale_rep.id_ware%TYPE,
      month t_sale_rep.month%TYPE,
      out_qty t_sale_rep.out_qty%TYPE,
      out_sum t_sale_rep.out_sum%TYPE);
   TYPE outDataArray IS TABLE OF outData INDEX BY BINARY_INTEGER;
   v_out_data outDataArray;   
   d_next_month t_sale_rep.month%TYPE;
   ZERO_DIVISION EXCEPTION;
   PRAGMA EXCEPTION_INIT(ZERO_DIVISION, -01476);
   n_ware_price t_price_ware.price%TYPE;
BEFORE EACH ROW IS
BEGIN   
   :new.out_qty := :new.inp_qty + :new.supply_qty - :new.sale_qty;
   BEGIN
      :new.out_sum := (:new.inp_sum + :new.supply_sum) * (1 - :new.sale_qty / (:new.inp_qty + :new.supply_qty));
   EXCEPTION WHEN ZERO_DIVISION THEN
      SELECT price INTO n_ware_price FROM t_price_ware WHERE id_ware = :new.id_ware;
      :new.out_sum := :new.out_qty * n_ware_price;
   END;
   
   v_out_data(v_out_data.count).id_ware := :new.id_ware;
   v_out_data(v_out_data.count - 1).month := :new.month;
   v_out_data(v_out_data.count - 1).out_qty := :new.out_qty;
   v_out_data(v_out_data.count - 1).out_sum := :new.out_sum;
END BEFORE EACH ROW;

AFTER STATEMENT IS
BEGIN   
   IF v_out_data.count > 0 THEN
      FOR n_array_index IN 0 .. v_out_data.count - 1
      LOOP
         BEGIN
            SELECT month INTO d_next_month 
            FROM t_sale_rep WHERE id_ware = v_out_data(n_array_index).id_ware AND month > v_out_data(n_array_index).month
            ORDER BY month FETCH FIRST 1 ROW ONLY;      
         EXCEPTION WHEN NO_DATA_FOUND THEN
            d_next_month := NULL;
         END;
         
         IF d_next_month IS NOT NULL THEN
            UPDATE t_sale_rep 
            SET inp_qty = v_out_data(n_array_index).out_qty, inp_sum = v_out_data(n_array_index).out_sum
            WHERE id_ware = v_out_data(n_array_index).id_ware AND month = d_next_month;
         END IF;   
      END LOOP;
   END IF;   
END AFTER STATEMENT;       
END t_sales_report_fill_fields_update;
/
