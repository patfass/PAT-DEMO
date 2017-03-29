Class PATRONUS.Class.ReportBody Extends %Persistent
{

Property HL7MessageId As %String;

Property ConsultId As %String;

Property PDFReport As %String(MAXLEN = 3000000);

Storage Default
{
<Data name="ReportBodyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>HL7MessageId</Value>
</Value>
<Value name="3">
<Value>ConsultId</Value>
</Value>
<Value name="4">
<Value>PDFReport</Value>
</Value>
</Data>
<DataLocation>^PATRONUS.Class.ReportBodyD</DataLocation>
<DefaultData>ReportBodyDefaultData</DefaultData>
<IdLocation>^PATRONUS.Class.ReportBodyD</IdLocation>
<IndexLocation>^PATRONUS.Class.ReportBodyI</IndexLocation>
<StreamLocation>^PATRONUS.Class.ReportBodyS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
