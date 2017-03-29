Class PATRONUS.Messages.ConsultRequest Extends Ens.Request
{

Property FacilityId As %String;

Property HL7MessageId As %String;

Property MRN As %String;

Property FirstName As %String;

Property LastName As %String;

Property RequestTime As %String;

Property Notes As %String(MAXLEN = 30000);

Storage Default
{
<Data name="ConsultRequestDefaultData">
<Subscript>"ConsultRequest"</Subscript>
<Value name="1">
<Value>FacilityId</Value>
</Value>
<Value name="2">
<Value>HL7MessageId</Value>
</Value>
<Value name="3">
<Value>MRN</Value>
</Value>
<Value name="4">
<Value>FirstName</Value>
</Value>
<Value name="5">
<Value>LastName</Value>
</Value>
<Value name="6">
<Value>RequestTime</Value>
</Value>
<Value name="7">
<Value>Notes</Value>
</Value>
</Data>
<DefaultData>ConsultRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
