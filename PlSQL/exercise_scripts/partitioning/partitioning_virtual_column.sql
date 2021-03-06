CREATE TABLE t_supply (
   id_supply NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 100000,
   code VARCHAR2(30 CHAR),
   num VARCHAR2(30 CHAR),
   dt DATE NOT NULL,
   id_supplier NUMBER(10,0) NOT NULL,
   e_state VARCHAR2(10) NOT NULL,
   summa NUMBER(14,2),
   nds NUMBER(14,2),
   amount_without_nds AS (summa - nds),  -- virtual column
   PRIMARY KEY (id_supply)
)
PARTITION BY RANGE (dt) INTERVAL(NUMTOYMINTERVAL(1, 'MONTH'))
   SUBPARTITION BY RANGE(amount_without_nds)
      SUBPARTITION TEMPLATE(
         SUBPARTITION sp_small VALUES LESS THAN (20000),
         SUBPARTITION sp_medium VALUES LESS THAN (50000),
         SUBPARTITION sp_large VALUES LESS THAN (100000),
         SUBPARTITION sp_extreme VALUES LESS THAN (MAXVALUE)
      )( 
   PARTITION values_before_2019 VALUES LESS THAN (DATE '2019-01-01'),
   PARTITION p1 VALUES LESS THAN (DATE '2019-02-01'),
   PARTITION p2 VALUES LESS THAN (DATE '2019-03-01'),
   PARTITION p3 VALUES LESS THAN (DATE '2019-04-01')
)
ENABLE ROW MOVEMENT; 

  
