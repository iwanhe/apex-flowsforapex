declare
  l_dgrm_content clob;
begin
  l_dgrm_content := apex_string.join_clob(
    apex_t_varchar2(
      q'[<?xml version="1.0" encoding="UTF-8"?>]'
      ,q'[<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:apex="https://flowsforapex.org" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" id="Definitions_1wzb475" targetNamespace="http://bpmn.io/schema/b" exporter="Flows for APEX" exporterVersion="23.1.0">]'
      ,q'[  <bpmn:process id="Process_A21f" name="A21f MessageFlow and Event Based Gateways" isExecutable="true" apex:manualInput="false">]'
      ,q'[    <bpmn:startEvent id="Event_Start" name="Start">]'
      ,q'[      <bpmn:outgoing>Flow_03sw70g</bpmn:outgoing>]'
      ,q'[    </bpmn:startEvent>]'
      ,q'[    <bpmn:task id="Activity_BeforeGateway" name="BeforeGateway">]'
      ,q'[      <bpmn:incoming>Flow_03sw70g</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1ey34y6</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_03sw70g" sourceRef="Event_Start" targetRef="Activity_BeforeGateway" />]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1ey34y6" sourceRef="Activity_BeforeGateway" targetRef="Gateway_1wgstis" />]'
      ,q'[    <bpmn:eventBasedGateway id="Gateway_1wgstis" name="EBG">]'
      ,q'[      <bpmn:incoming>Flow_1ey34y6</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_07vgiw0</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_13515ga</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_1siv5zn</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_009p1i1</bpmn:outgoing>]'
      ,q'[    </bpmn:eventBasedGateway>]'
      ,q'[    <bpmn:receiveTask id="Activity_Receive" name="Receive" apex:type="simpleMessage">]'
      ,q'[      <bpmn:extensionElements>]'
      ,q'[        <apex:messageName>]'
      ,q'[          <apex:expressionType>processVariable</apex:expressionType>]'
      ,q'[          <apex:expression>messagename</apex:expression>]'
      ,q'[        </apex:messageName>]'
      ,q'[        <apex:correlationKey>]'
      ,q'[          <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[          <apex:expression>'Processor'</apex:expression>]'
      ,q'[        </apex:correlationKey>]'
      ,q'[        <apex:correlationValue>]'
      ,q'[          <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[          <apex:expression>'Receive'</apex:expression>]'
      ,q'[        </apex:correlationValue>]'
      ,q'[      </bpmn:extensionElements>]'
      ,q'[      <bpmn:incoming>Flow_07vgiw0</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0z7lv2k</bpmn:outgoing>]'
      ,q'[    </bpmn:receiveTask>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_07vgiw0" sourceRef="Gateway_1wgstis" targetRef="Activity_Receive" />]'
      ,q'[    <bpmn:intermediateCatchEvent id="Event_ICEMessage1" name="ICEMessage1" apex:type="simpleMessage">]'
      ,q'[      <bpmn:incoming>Flow_13515ga</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0nrp589</bpmn:outgoing>]'
      ,q'[      <bpmn:messageEventDefinition id="MessageEventDefinition_0mkhhdo">]'
      ,q'[        <bpmn:extensionElements>]'
      ,q'[          <apex:messageName>]'
      ,q'[            <apex:expressionType>processVariable</apex:expressionType>]'
      ,q'[            <apex:expression>messagename</apex:expression>]'
      ,q'[          </apex:messageName>]'
      ,q'[          <apex:correlationKey>]'
      ,q'[            <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[            <apex:expression>'Processor'</apex:expression>]'
      ,q'[          </apex:correlationKey>]'
      ,q'[          <apex:correlationValue>]'
      ,q'[            <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[            <apex:expression>'ICE'||'Message1'</apex:expression>]'
      ,q'[          </apex:correlationValue>]'
      ,q'[        </bpmn:extensionElements>]'
      ,q'[      </bpmn:messageEventDefinition>]'
      ,q'[    </bpmn:intermediateCatchEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_13515ga" sourceRef="Gateway_1wgstis" targetRef="Event_ICEMessage1" />]'
      ,q'[    <bpmn:intermediateCatchEvent id="Event_ICEMessage2" name="ICEMessage2" apex:type="simpleMessage">]'
      ,q'[      <bpmn:incoming>Flow_1siv5zn</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0aufudp</bpmn:outgoing>]'
      ,q'[      <bpmn:messageEventDefinition id="MessageEventDefinition_0yqmzvh">]'
      ,q'[        <bpmn:extensionElements>]'
      ,q'[          <apex:messageName>]'
      ,q'[            <apex:expressionType>processVariable</apex:expressionType>]'
      ,q'[            <apex:expression>messagename</apex:expression>]'
      ,q'[          </apex:messageName>]'
      ,q'[          <apex:correlationKey>]'
      ,q'[            <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[            <apex:expression>'Processor'</apex:expression>]'
      ,q'[          </apex:correlationKey>]'
      ,q'[          <apex:correlationValue>]'
      ,q'[            <apex:expressionType>plsqlRawExpression</apex:expressionType>]'
      ,q'[            <apex:expression>'ICE'||'Message2'</apex:expression>]'
      ,q'[          </apex:correlationValue>]'
      ,q'[        </bpmn:extensionElements>]'
      ,q'[      </bpmn:messageEventDefinition>]'
      ,q'[    </bpmn:intermediateCatchEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1siv5zn" sourceRef="Gateway_1wgstis" targetRef="Event_ICEMessage2" />]'
      ,q'[    <bpmn:intermediateCatchEvent id="Event_ICETimer" name="ICETimer">]'
      ,q'[      <bpmn:incoming>Flow_009p1i1</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1yh856b</bpmn:outgoing>]'
      ,q'[      <bpmn:timerEventDefinition id="TimerEventDefinition_1kq124i" apex:timerType="oracleDuration">]'
      ,q'[        <bpmn:extensionElements>]'
      ,q'[          <apex:oracleDuration>]'
      ,q'[            <apex:intervalDS>000 00:00:05</apex:intervalDS>]'
      ,q'[          </apex:oracleDuration>]'
      ,q'[        </bpmn:extensionElements>]'
      ,q'[      </bpmn:timerEventDefinition>]'
      ,q'[    </bpmn:intermediateCatchEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_009p1i1" sourceRef="Gateway_1wgstis" targetRef="Event_ICETimer" />]'
      ,q'[    <bpmn:task id="Activity_After_Receive" name="After Receive">]'
      ,q'[      <bpmn:incoming>Flow_0z7lv2k</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0lbe0co</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0z7lv2k" sourceRef="Activity_Receive" targetRef="Activity_After_Receive" />]'
      ,q'[    <bpmn:task id="Activity_After_ICEMessage1" name="After ICEMessage1">]'
      ,q'[      <bpmn:incoming>Flow_0nrp589</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0bexo21</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0nrp589" sourceRef="Event_ICEMessage1" targetRef="Activity_After_ICEMessage1" />]'
      ,q'[    <bpmn:task id="Activity_After_ICEMessage2" name="After ICEMessage2">]'
      ,q'[      <bpmn:incoming>Flow_0aufudp</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_1j37tji</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0aufudp" sourceRef="Event_ICEMessage2" targetRef="Activity_After_ICEMessage2" />]'
      ,q'[    <bpmn:task id="Activity_After_ICETimer" name="After ICETimer">]'
      ,q'[      <bpmn:incoming>Flow_1yh856b</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0fp8uvo</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1yh856b" sourceRef="Event_ICETimer" targetRef="Activity_After_ICETimer" />]'
      ,q'[    <bpmn:endEvent id="Event_ICETimerEnd" name="ICETimerEnd">]'
      ,q'[      <bpmn:incoming>Flow_0fp8uvo</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0fp8uvo" sourceRef="Activity_After_ICETimer" targetRef="Event_ICETimerEnd" apex:sequence="10" />]'
      ,q'[    <bpmn:endEvent id="Event_ICEMessage2End" name="ICEMessage2End">]'
      ,q'[      <bpmn:incoming>Flow_1j37tji</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_1j37tji" sourceRef="Activity_After_ICEMessage2" targetRef="Event_ICEMessage2End" />]'
      ,q'[    <bpmn:endEvent id="Event_ICEMessage1End" name="ICEMessage1End">]'
      ,q'[      <bpmn:incoming>Flow_0bexo21</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0bexo21" sourceRef="Activity_After_ICEMessage1" targetRef="Event_ICEMessage1End" />]'
      ,q'[    <bpmn:endEvent id="Event_ReceiveEnd" name="ReceiveEnd">]'
      ,q'[      <bpmn:incoming>Flow_0lbe0co</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0lbe0co" sourceRef="Activity_After_Receive" targetRef="Event_ReceiveEnd" />]'
      ,q'[  </bpmn:process>]'
      ,q'[  <bpmndi:BPMNDiagram id="BPMNDiagram_1">]'
      ,q'[    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_A21f">]'
      ,q'[      <bpmndi:BPMNShape id="Event_1md9c7x_di" bpmnElement="Event_Start">]'
      ,q'[        <dc:Bounds x="332" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="338" y="485" width="24" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1d1xskx_di" bpmnElement="Activity_BeforeGateway">]'
      ,q'[        <dc:Bounds x="420" y="420" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_0z1agiw_di" bpmnElement="Gateway_1wgstis">]'
      ,q'[        <dc:Bounds x="575" y="435" width="50" height="50" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="568" y="403" width="24" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_063omhq_di" bpmnElement="Activity_Receive">]'
      ,q'[        <dc:Bounds x="710" y="280" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0s13zp9_di" bpmnElement="Event_ICEMessage1">]'
      ,q'[        <dc:Bounds x="712" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="696" y="485" width="70" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0oi3p42_di" bpmnElement="Event_ICEMessage2">]'
      ,q'[        <dc:Bounds x="712" y="552" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="696" y="595" width="70" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0ju3fea_di" bpmnElement="Event_ICETimer">]'
      ,q'[        <dc:Bounds x="712" y="662" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="707" y="705" width="47" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_02bui9i_di" bpmnElement="Activity_After_Receive">]'
      ,q'[        <dc:Bounds x="900" y="280" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1lza23k_di" bpmnElement="Activity_After_ICEMessage1">]'
      ,q'[        <dc:Bounds x="900" y="420" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1f1lgah_di" bpmnElement="Activity_After_ICEMessage2">]'
      ,q'[        <dc:Bounds x="900" y="530" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1n0ie5j_di" bpmnElement="Activity_After_ICETimer">]'
      ,q'[        <dc:Bounds x="900" y="640" width="100" height="80" />]'
      ,q'[        <bpmndi:BPMNLabel />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1848vm5_di" bpmnElement="Event_ICETimerEnd">]'
      ,q'[        <dc:Bounds x="1152" y="662" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1137" y="705" width="66" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1hglcll_di" bpmnElement="Event_ICEMessage2End">]'
      ,q'[        <dc:Bounds x="1152" y="552" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1126" y="595" width="89" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1be6xv8_di" bpmnElement="Event_ICEMessage1End">]'
      ,q'[        <dc:Bounds x="1152" y="442" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1126" y="485" width="89" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0a3m14i_di" bpmnElement="Event_ReceiveEnd">]'
      ,q'[        <dc:Bounds x="1152" y="302" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="1140" y="345" width="60" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_03sw70g_di" bpmnElement="Flow_03sw70g">]'
      ,q'[        <di:waypoint x="368" y="460" />]'
      ,q'[        <di:waypoint x="420" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1ey34y6_di" bpmnElement="Flow_1ey34y6">]'
      ,q'[        <di:waypoint x="520" y="460" />]'
      ,q'[        <di:waypoint x="575" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_07vgiw0_di" bpmnElement="Flow_07vgiw0">]'
      ,q'[        <di:waypoint x="600" y="435" />]'
      ,q'[        <di:waypoint x="600" y="320" />]'
      ,q'[        <di:waypoint x="710" y="320" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_13515ga_di" bpmnElement="Flow_13515ga">]'
      ,q'[        <di:waypoint x="625" y="460" />]'
      ,q'[        <di:waypoint x="712" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1siv5zn_di" bpmnElement="Flow_1siv5zn">]'
      ,q'[        <di:waypoint x="600" y="485" />]'
      ,q'[        <di:waypoint x="600" y="570" />]'
      ,q'[        <di:waypoint x="712" y="570" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_009p1i1_di" bpmnElement="Flow_009p1i1">]'
      ,q'[        <di:waypoint x="600" y="485" />]'
      ,q'[        <di:waypoint x="600" y="680" />]'
      ,q'[        <di:waypoint x="712" y="680" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0z7lv2k_di" bpmnElement="Flow_0z7lv2k">]'
      ,q'[        <di:waypoint x="810" y="320" />]'
      ,q'[        <di:waypoint x="900" y="320" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0nrp589_di" bpmnElement="Flow_0nrp589">]'
      ,q'[        <di:waypoint x="748" y="460" />]'
      ,q'[        <di:waypoint x="900" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0aufudp_di" bpmnElement="Flow_0aufudp">]'
      ,q'[        <di:waypoint x="748" y="570" />]'
      ,q'[        <di:waypoint x="900" y="570" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1yh856b_di" bpmnElement="Flow_1yh856b">]'
      ,q'[        <di:waypoint x="748" y="680" />]'
      ,q'[        <di:waypoint x="900" y="680" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0fp8uvo_di" bpmnElement="Flow_0fp8uvo">]'
      ,q'[        <di:waypoint x="1000" y="680" />]'
      ,q'[        <di:waypoint x="1152" y="680" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_1j37tji_di" bpmnElement="Flow_1j37tji">]'
      ,q'[        <di:waypoint x="1000" y="570" />]'
      ,q'[        <di:waypoint x="1152" y="570" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0bexo21_di" bpmnElement="Flow_0bexo21">]'
      ,q'[        <di:waypoint x="1000" y="460" />]'
      ,q'[        <di:waypoint x="1152" y="460" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0lbe0co_di" bpmnElement="Flow_0lbe0co">]'
      ,q'[        <di:waypoint x="1000" y="320" />]'
      ,q'[        <di:waypoint x="1152" y="320" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[    </bpmndi:BPMNPlane>]'
      ,q'[  </bpmndi:BPMNDiagram>]'
      ,q'[</bpmn:definitions>]'
      ,q'[]'
  ));
  flow_diagram.upload_and_parse(
    pi_dgrm_name => 'A21f - Basic Messageflow - EBG',
    pi_dgrm_version => '0',
    pi_dgrm_category => 'Testing',
    pi_dgrm_content => l_dgrm_content
);
end;
/