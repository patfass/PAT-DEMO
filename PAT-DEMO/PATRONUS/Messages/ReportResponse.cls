Class PATRONUS.Messages.ReportResponse Extends Ens.Response
{

Property StatusFlag As %String;

Property StatusText As %String;

Storage Default
{
<Data name="ReportResponseDefaultData">
<Subscript>"ReportResponse"</Subscript>
<Value name="1">
<Value>StatusFlag</Value>
</Value>
<Value name="2">
<Value>StatusText</Value>
</Value>
</Data>
<DefaultData>ReportResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
