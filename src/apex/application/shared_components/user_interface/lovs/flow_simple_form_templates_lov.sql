prompt --application/shared_components/user_interface/lovs/flow_simple_form_templates_lov
begin
--   Manifest
--     FLOW_SIMPLE_FORM_TEMPLATES_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.11'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'FLOWS4APEX'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(10362301203290988)
,p_lov_name=>'FLOW_SIMPLE_FORM_TEMPLATES_LOV'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'FLOW_SIMPLE_FORM_TEMPLATES'
,p_return_column_name=>'SFTE_ID'
,p_display_column_name=>'SFTE_NAME'
,p_default_sort_column_name=>'SFTE_NAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
