Class PATRONUS.Messages.ReportRequest Extends Ens.Request
{

Property HL7MessageId As %String;

Property ConsultId As %String;

Property PDFReport As %String(MAXLEN = 3000000);

Property HL7Message As EnsLib.HL7.Message;

Storage Default
{
<Data name="ReportRequestDefaultData">
<Subscript>"ReportRequest"</Subscript>
<Value name="1">
<Value>HL7MessageId</Value>
</Value>
<Value name="2">
<Value>ConsultId</Value>
</Value>
<Value name="3">
<Value>PDFReport</Value>
</Value>
<Value name="4">
<Value>HL7Message</Value>
</Value>
</Data>
<DefaultData>ReportRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
