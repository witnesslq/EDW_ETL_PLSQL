declare  
  type array_table is table of varchar2(4000 char) index by binary_integer;  --定义表  
  lvc_array array_table;  
  i         number;  
begin  
  dbms_output.enable(buffer_size => null);                                                    --防止默认2000个字节的报错  
  execute immediate 'select *  
  from TABLE(DBMS_XPLAN.DISPLAY_CURSOR(''b48q9r2cmh4j6'', 0, ''ADVANCED''))' bulk  
                    collect  
    into lvc_array;                                                                           --利用select *  bulk collect into  
  
  for i in 1 .. lvc_array.count loop                                                          --利用for  in  loop  end loop遍历列表元素  
    dbms_output.put_line(lvc_array(i));  
  end loop;  
end;