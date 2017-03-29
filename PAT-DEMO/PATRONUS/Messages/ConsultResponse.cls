Class PATRONUS.Messages.ConsultResponse Extends Ens.Response
{

Property ConsultId As %String;

Property ErrorText As %String;

Property Message As %String;

Storage Default
{
<Data name="ConsultResponseDefaultData">
<Subscript>"ConsultResponse"</Subscript>
<Value name="1">
<Value>ConsultId</Value>
</Value>
<Value name="2">
<Value>ErrorText</Value>
</Value>
<Value name="3">
<Value>Message</Value>
</Value>
</Data>
<DefaultData>ConsultResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
