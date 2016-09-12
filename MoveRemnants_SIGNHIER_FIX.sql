alter table unitlist disable all triggers;
update unitlist ul set ul.sign_jurpers = 0 where unitcode='MoveRemnants';
alter table unitlist enable all triggers;
execute P_SYSTEM_INIT_UNIT( 'MoveRemnants', null, null, 2, 1, 0, 0, 0, 0, 0 );
alter table unitlist disable all triggers;
update unitlist ul set ul.sign_jurpers = 1 where unitcode='MoveRemnants';
alter table unitlist enable all triggers;
update MOVEREMNSHISTORY set CRN=(select RN from acatalog where docname='MoveRemnants' and is_root=1) where crn is null;
commit;
