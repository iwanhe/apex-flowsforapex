/*
  Migration Script for Release 5.1.2 to 21.1
*/

PROMPT >> Running DDL for Upgrade from 5.1.2 to 21.1
PROMPT >> -------------------------------------------

PROMPT >> Remove obsolete objects
drop view flow_p0010_subflows_vw;
drop view flow_p0010_variables_vw;
drop view flow_p0010_branches_vw;
drop view flow_p0010_routes_vw;

drop package flow_p0010_api;

PROMPT >> Create new tables
CREATE TABLE flow_object_expressions (
    expr_id          NUMBER
        GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 CACHE 20 )
    NOT NULL,
    expr_objt_id     NUMBER NOT NULL,
    expr_set         VARCHAR2(20 CHAR) NOT NULL,
    expr_order       NUMBER NOT NULL,
    expr_var_name    VARCHAR2(50 CHAR) NOT NULL,
    expr_var_type    VARCHAR2(50 CHAR) NOT NULL,
    expr_type        VARCHAR2(130 CHAR) NOT NULL,
    expr_expression  VARCHAR2(4000 CHAR) 
 );

ALTER TABLE flow_object_expressions ADD CONSTRAINT expr_pk PRIMARY KEY (expr_id);                                                     

ALTER TABLE flow_object_expressions 
    ADD CONSTRAINT expr_uk UNIQUE ( expr_objt_id, expr_set, expr_order);
  
ALTER TABLE flow_object_expressions
    ADD CONSTRAINT expr_objt_fk FOREIGN KEY ( expr_objt_id )
        REFERENCES flow_objects ( objt_id )
            ON DELETE CASCADE;

ALTER TABLE flow_object_expressions
    ADD CONSTRAINT expr_set_ck
      CHECK ( expr_set in ('beforeEvent', 'onEvent', 'beforeTask', 'afterTask', 'beforeSplit', 'afterMerge') );

create table flow_flow_event_log
( lgfl_dgrm_id       		NUMBER NOT NULL
, lgfl_dgrm_name     		VARCHAR2(150 CHAR) NOT NULL
, lgfl_dgrm_version  		VARCHAR2(10 CHAR) NOT NULL
, lgfl_dgrm_status   		VARCHAR2(10 CHAR) NOT NULL
, lgfl_dgrm_category 		VARCHAR2(30 CHAR)
, lgfl_timestamp 			TIMESTAMP WITH TIME ZONE NOT NULL
, lgfl_user				    VARCHAR2(255 char)
, lgfl_comment              VARCHAR2(2000 CHAR)
, lgfl_dgrm_content  		CLOB
);

create table flow_instance_event_log
( lgpr_prcs_id           	NUMBER NOT NULL
, lgpr_objt_id              VARCHAR2(50 CHAR) NULL
, lgpr_dgrm_id      		NUMBER NOT NULL
, lgpr_prcs_name         	VARCHAR2(150 CHAR) NOT NULL
, lgpr_business_id			VARCHAR2(4000 char)
, lgpr_prcs_event       	VARCHAR2(20 CHAR) NOT NULL
, lgpr_timestamp     		TIMESTAMP WITH TIME ZONE NOT NULL
, lgpr_user 				VARCHAR2(255 char)
, lgpr_comment				VARCHAR2(2000 CHAR)
, lgpr_error_info           VARCHAR2(2000 CHAR)
);


create table flow_step_event_log
( lgsf_prcs_id       		NUMBER NOT NULL
, lgsf_objt_id       		VARCHAR2(50) NOT NULL
, lgsf_sbfl_id      		NUMBER NOT NULL
, lgsf_sbfl_process_level   NUMBER
, lgsf_last_completed 	    VARCHAR2(50) 
, lgsf_status_when_complete VARCHAR2(20)
, lgsf_sbfl_dgrm_id   	    NUMBER NOT NULL
, lgsf_was_current		    TIMESTAMP WITH TIME ZONE
, lgsf_started 			    TIMESTAMP WITH TIME ZONE
, lgsf_completed 			TIMESTAMP WITH TIME ZONE 
, lgsf_reservation		    VARCHAR2(255 char)
, lgsf_user				    VARCHAR2(255 char)	
, lgsf_comment         	    VARCHAR2(2000 CHAR)
);

create table flow_variable_event_log
( lgvr_prcs_id			    number not null
, lgvr_var_name			    varchar2(50 char) not null
, lgvr_objt_id			    VARCHAR2(50 char) 
, lgvr_sbfl_id			    NUMBER
, lgvr_expr_set			    VARCHAR2(20 CHAR) 
, lgvr_timestamp			TIMESTAMP WITH TIME ZONE NOT NULL
, lgvr_var_type			    varchar2(50 char) not null 
, lgvr_var_vc2 			    varchar2(4000 char)
, lgvr_var_num 			    number
, lgvr_var_date 			date
, lgvr_var_clob 			clob
);

create table flow_configuration
( cfig_key                  varchar2(50 char) NOT NULL
, cfig_value                varchar2(2000 char)
);

alter table flow_configuration ADD CONSTRAINT cfig_pk PRIMARY KEY ( cfig_key );

create table flow_messages
( fmsg_message_key          varchar2(30 char) not null
, fmsg_lang                 varchar2(10 char) not null
, fmsg_message_content      varchar2(2000 char) 
);

alter table flow_messages ADD CONSTRAINT fmsg_pk PRIMARY KEY ( fmsg_message_key, fmsg_lang );

PROMPT >> Alter existing tables
alter table flow_subflows add sbfl_dgrm_id number;
alter table flow_subflows add constraint sbfl_dgrm_fk foreign key (sbfl_dgrm_id) references flow_diagrams (dgrm_id) enable;
alter table flow_subflows add sbfl_became_current timestamp with time zone;
alter table flow_subflows add sbfl_work_started timestamp with time zone;

PROMPT >> Datas migration

-- data migration - copy dgrm_id from flow_processes.prcs_dgrm_id to all flow_subflows rows in that process sbfl_dgrm_id
begin
  for rec in (
    select prcs_id, prcs_dgrm_id
    from flow_processes
  )
  loop
    update flow_subflows
       set sbfl_dgrm_id = rec.prcs_dgrm_id
     where sbfl_prcs_id = rec.prcs_id;
  end loop;
end;
/
alter table flow_subflows modify (sbfl_dgrm_id not null);