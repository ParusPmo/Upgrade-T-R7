create or replace view v_userpriv as
select
  UP.COMPANY,                           -- COMPANY
  UP.VERSION,                           -- VERSION
  UP.UNITCODE,                          -- UNITCODE
  UP.CATALOG,                           -- CATALOG
  UP.JUR_PERS,                          -- JUR_PERS
  UP.HIERARCHY                          -- HIERARCHY
from
  USERPRIV UP
where
     exists
     (
       select null
         from USERROLES UR
         where     UR.ROLEID = UP.ROLEID
               and UR.AUTHID = nvl(sys_context('PARUS'||'$'||lpad(ltrim(to_char(to_number(sys_context('USERENV','CURRENT_SCHEMAID')),'XXXXXXXX')),8,'0')||'$'||'SYSTEM','UTILIZER'),sys_context('USERENV','SESSION_USER'))
     )
  --or UP.AUTHID = nvl(sys_context('PARUS'||'$'||lpad(ltrim(to_char(to_number(sys_context('USERENV','CURRENT_SCHEMAID')),'XXXXXXXX')),8,'0')||'$'||'SYSTEM','UTILIZER'),sys_context('USERENV','SESSION_USER'))
  ;
