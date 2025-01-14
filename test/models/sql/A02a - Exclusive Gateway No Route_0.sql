declare
  l_dgrm_content clob;
begin
  l_dgrm_content := apex_string.join_clob(
    apex_t_varchar2(
      q'[<?xml version="1.0" encoding="UTF-8"?>]'
      ,q'[<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" id="Definitions_1wzb475" targetNamespace="http://bpmn.io/schema/b" exporter="Flows for APEX" exporterVersion="22.1.0">]'
      ,q'[  <bpmn:process id="Process_0rxermh" isExecutable="false">]'
      ,q'[    <bpmn:startEvent id="Start" name="Start">]'
      ,q'[      <bpmn:outgoing>Flow_0k5azlb</bpmn:outgoing>]'
      ,q'[    </bpmn:startEvent>]'
      ,q'[    <bpmn:exclusiveGateway id="Exclusive" name="Exclusive">]'
      ,q'[      <bpmn:incoming>Flow_0k5azlb</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0294h9i</bpmn:outgoing>]'
      ,q'[      <bpmn:outgoing>Flow_0yvrnp4</bpmn:outgoing>]'
      ,q'[    </bpmn:exclusiveGateway>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0k5azlb" sourceRef="Start" targetRef="Exclusive" />]'
      ,q'[    <bpmn:task id="A" name="A">]'
      ,q'[      <bpmn:incoming>Flow_0294h9i</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_0qcgplu</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0294h9i" sourceRef="Exclusive" targetRef="A" />]'
      ,q'[    <bpmn:task id="B" name="B">]'
      ,q'[      <bpmn:incoming>Flow_0yvrnp4</bpmn:incoming>]'
      ,q'[      <bpmn:outgoing>Flow_07maxdg</bpmn:outgoing>]'
      ,q'[    </bpmn:task>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0yvrnp4" sourceRef="Exclusive" targetRef="B" />]'
      ,q'[    <bpmn:endEvent id="EndA" name="EndA">]'
      ,q'[      <bpmn:incoming>Flow_0qcgplu</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_0qcgplu" sourceRef="A" targetRef="EndA" />]'
      ,q'[    <bpmn:endEvent id="EndB" name="EndB">]'
      ,q'[      <bpmn:incoming>Flow_07maxdg</bpmn:incoming>]'
      ,q'[    </bpmn:endEvent>]'
      ,q'[    <bpmn:sequenceFlow id="Flow_07maxdg" sourceRef="B" targetRef="EndB" />]'
      ,q'[  </bpmn:process>]'
      ,q'[  <bpmndi:BPMNDiagram id="BPMNDiagram_1">]'
      ,q'[    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_0rxermh">]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0k5azlb_di" bpmnElement="Flow_0k5azlb">]'
      ,q'[        <di:waypoint x="198" y="300" />]'
      ,q'[        <di:waypoint x="245" y="300" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0294h9i_di" bpmnElement="Flow_0294h9i">]'
      ,q'[        <di:waypoint x="270" y="275" />]'
      ,q'[        <di:waypoint x="270" y="240" />]'
      ,q'[        <di:waypoint x="370" y="240" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0yvrnp4_di" bpmnElement="Flow_0yvrnp4">]'
      ,q'[        <di:waypoint x="270" y="325" />]'
      ,q'[        <di:waypoint x="270" y="360" />]'
      ,q'[        <di:waypoint x="370" y="360" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_0qcgplu_di" bpmnElement="Flow_0qcgplu">]'
      ,q'[        <di:waypoint x="470" y="240" />]'
      ,q'[        <di:waypoint x="532" y="240" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNEdge id="Flow_07maxdg_di" bpmnElement="Flow_07maxdg">]'
      ,q'[        <di:waypoint x="470" y="360" />]'
      ,q'[        <di:waypoint x="532" y="360" />]'
      ,q'[      </bpmndi:BPMNEdge>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1yu3z7x_di" bpmnElement="Start">]'
      ,q'[        <dc:Bounds x="162" y="282" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="168" y="325" width="24" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Gateway_15ac49o_di" bpmnElement="Exclusive" isMarkerVisible="true">]'
      ,q'[        <dc:Bounds x="245" y="275" width="50" height="50" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="327" y="290" width="47" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_0xjo3mr_di" bpmnElement="A">]'
      ,q'[        <dc:Bounds x="370" y="200" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Activity_1so7xgq_di" bpmnElement="B">]'
      ,q'[        <dc:Bounds x="370" y="320" width="100" height="80" />]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_0pf7iab_di" bpmnElement="EndA">]'
      ,q'[        <dc:Bounds x="532" y="222" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="537" y="265" width="27" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[      <bpmndi:BPMNShape id="Event_1c6elcb_di" bpmnElement="EndB">]'
      ,q'[        <dc:Bounds x="532" y="342" width="36" height="36" />]'
      ,q'[        <bpmndi:BPMNLabel>]'
      ,q'[          <dc:Bounds x="537" y="385" width="26" height="14" />]'
      ,q'[        </bpmndi:BPMNLabel>]'
      ,q'[      </bpmndi:BPMNShape>]'
      ,q'[    </bpmndi:BPMNPlane>]'
      ,q'[  </bpmndi:BPMNDiagram>]'
      ,q'[</bpmn:definitions>]'
      ,q'[]'
  ));
  flow_diagram.upload_and_parse(
    pi_dgrm_name => 'A02a - Exclusive Gateway No Route',
    pi_dgrm_version => '0',
    pi_dgrm_category => 'Testing',
    pi_dgrm_content => l_dgrm_content,
    pi_force_overwrite => true
);
end;
/
