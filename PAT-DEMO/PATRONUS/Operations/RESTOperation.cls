Class PATRONUS.Operations.RESTOperation Extends EnsLib.REST.Operation
{

Method OnMessage(pRequest As PATRONUS.Messages.ConsultRequest, Output pResponse As PATRONUS.Messages.ConsultResponse) As %Status
{
	set tSC = $SYSTEM.Status.OK()
    set pStream = ##class(%Stream.TmpCharacter).%New()
      
    set tSC = ..ObjectToJSONStream(pRequest,pStream)
    quit:$SYSTEM.Status.IsError(tSC) tSC
      
    set HttpRequest = ##class(%Net.HttpRequest).%New()
    set HttpRequest.ContentType = "application/json"
      
    set pData(1) = pStream.Read()
      
    set tSC = ..Adapter.SendFormDataArray(.HttpResponse,"POST",HttpRequest,,.pData,..Adapter.URL)
      
    if $SYSTEM.Status.IsOK(tSC) {
           set pResponse = ##class(PATRONUS.Messages.ConsultResponse).%New()
           set tSC=..JSONStreamToObject(HttpResponse.Data,.pResponse,pResponse.%ClassName(1))
    }
      
    Quit tSC
}

}
