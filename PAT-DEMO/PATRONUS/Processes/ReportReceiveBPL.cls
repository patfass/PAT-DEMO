/// 
Class PATRONUS.Processes.ReportReceiveBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='PATRONUS.Messages.ReportRequest' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='HL7MessageId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ORMHL7Message' type='EnsLib.HL7.Message' instantiate='0' />
<property name='ORUHL7Message' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='850' >
<assign name="Set HL7MessageId" property="context.HL7MessageId" value="request.HL7MessageId" action="set" xpos='200' ypos='250' />
<code name='Get Original HL7 Message' xpos='200' ypos='350' >
<![CDATA[ set context.ORMHL7Message=##class(EnsLib.HL7.Message).%OpenId(context.HL7MessageId)
 ]]>
</code>
<transform name='Transform ORM to ORU' class='PATRONUS.DTL.ORMToORUDTL' source='context.ORMHL7Message' target='context.ORUHL7Message' xpos='200' ypos='450' />
<assign name="Set HL7Message" property="request.HL7Message" value="context.ORUHL7Message" action="set" xpos='200' ypos='550' />
<transform name='Transform Report Request to ORU' class='PATRONUS.DTL.ReportResponseToORU' source='request' target='context.ORUHL7Message' xpos='200' ypos='650' />
<call name='Call HL7OutboundTCP Operation' target='HL7OutboundTCP' async='0' xpos='200' ypos='750' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.ORUHL7Message" action="set" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
