/// 
Class PATRONUS.Processes.ConsultRequestBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='ConsultRequest' type='PATRONUS.Messages.ConsultRequest' instantiate='0' />
<property name='ConsultResponse' type='PATRONUS.Messages.ConsultResponse' instantiate='0' />
<property name='MessageId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='750' >
<assign name="Get MessageID" property="context.MessageId" value="request.%Id()" action="set" xpos='200' ypos='250' />
<transform name='HL7ToConsultRequest' class='PATRONUS.DTL.HL7ToConsultRequest' source='request' target='context.ConsultRequest' xpos='200' ypos='350' />
<call name='Call REST Server' target='ConsultRequestREST' async='0' xpos='200' ypos='450' >
<request type='Ens.Request' >
<assign property="callrequest" value="context.ConsultRequest" action="set" />
</request>
<response type='Ens.Response' >
<assign property="context.ConsultResponse" value="callresponse" action="set" />
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
