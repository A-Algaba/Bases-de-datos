alter session set "_ORACLE_SCRIPT" = true;

create user curso identified by "Med@c"
default tablespace users
temporary tablespace temp
quota 100M on users;

drop user curso cascade;

grant connect, resource to curso;