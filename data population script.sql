
-- begin data population 

/* supplier data */
---------------------
    INSERT INTO t_supplier (moniker, name) 
    VALUES ('Kogankids', 'Kogankids Group Limited');
    ---------------------
    INSERT INTO t_supplier (moniker, name) 
    VALUES ('Bravo', 'Bravo Inc.');
    ---------------------
    INSERT INTO t_supplier (moniker, name) 
    VALUES ('Lipar', 'Lipar Group');
    ---------------------
    INSERT INTO t_supplier (moniker, name) 
    VALUES ('Misstix', 'Misstix Corporation');
    ---------------------
    INSERT INTO t_supplier (moniker, name) 
    VALUES ('Modalight', 'Modalight Co. Ltd.');
   
/* department data */
---------------------
    INSERT INTO t_dept (name)
    VALUES ('Administration');
    ---------------------
    INSERT INTO t_dept (name)
    VALUES ('IT');
    ---------------------
    INSERT INTO t_dept (name)
    VALUES ('Sales');
    ---------------------
    INSERT INTO t_dept (name)
    VALUES ('Delivery');
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Grodno region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Vitebsk region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Brest region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Gomel region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Minsk region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
    ---------------------
    INSERT INTO t_dept (name, id_parent)
    VALUES ('Mogilev region', (SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('sales')));
       
/* client data */
---------------------
    
    --grodno region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('grodno region')),
    '256bit.by', '�������� ������� 256bit.by', 1, 'Grodno');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('grodno region')),
    '�������', '������� ������� �.������', 0, 'Slonim');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('grodno region')),
    'interm.by', '�������� ������� interm.by', 0, 'Dyatlovo');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('grodno region')),
    'mistergadget', '������� mistergadget.by', 0, 'Grodno');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('grodno region')),
    'bitrade.by', '��������-������� Bittrade.by', 1, 'Grodno');
    ---------------------
    
    --vitebsk region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('vitebsk region')),
    'Monitor', '�������� ������� Monitor', 0, 'Vitebsk');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('vitebsk region')),
    'Polcomp', '������� Polcomp.by', 0, 'Polotsk');
    ---------------------
    
    --brest region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('brest region')),
    'polisan.by', '������� Polisan', 0, 'Pinsk');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('brest region')),
    'xobbi.by', '������� xobbi.by', 0, 'Brest');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('brest region')),
    'bixenon.by', '������� bixenon.by', 0, 'Kobrin');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('brest region')),
    'v-breste.by', '������� v-breste.by', 0, 'Brest');
    ---------------------
    
    --gomel region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('gomel region')),
    'ShopGomel.by', '�������� ������� ShopGomel', 0, 'Gomel');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('gomel region')),
    '���� ����', '��� "���� ����"', 0, 'Rogachev');
    ---------------------
    
    --mogilev region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('mogilev region')),
    '�����', '������� ������� �����', 0, 'Mogilev');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('mogilev region')),
    '���� ����', '��� "���� ����"', 0, 'Rogachev');
    ---------------------
    
    --minsk region clients
    
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('minsk region')),
    '21.vek', '��������-�������  21.vek.by', 1, 'Minsk');
    ---------------------
    INSERT INTO t_client (id_dept, moniker, name, is_vip, town)
    VALUES ((SELECT id_dept FROM t_dept WHERE UPPER(name)=UPPER('minsk region')),
    '5 element', '������� ������� 5 �������', 1, 'Minsk');

/* node data */
---------------------
    INSERT INTO t_ctl_node (code, name) 
    VALUES ('equip', 'equipment');
    ---------------------    
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('equip')),
    'house', 'household equipment');
    ---------------------
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('equip')),
    'dev', 'devices');
    ---------------------
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('dev')),
    'phones', 'mobile phones');
    ---------------------
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('dev')),
    'notebooks', 'notebooks, laptops etc.');
    ---------------------
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('house')),
    'fridges', 'fridges');
    ---------------------
    INSERT INTO t_ctl_node (id_parent, code, name) 
    VALUES ((SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('house')),
    'cleaners', 'vacuum cleaners');

/* model data */
---------------------
    --INSERT INTO t_model (moniker, name, id_node, grp, subgrp, label) 
    --VALUES ('Honor 10L', 'Honor 10 Lite 3GB/32GB',
    --(SELECT id_ctl_node FROM t_ctl_node WHERE UPPER(code)=UPPER('phones'),
   -- 'phones', 'mobile phones', 'HTC');
    ---------------------        
    
    COMMIT;
    
    
    
    
    
    
    
