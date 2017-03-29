Class PATRONUS.Services.RESTReportService Extends EnsLib.REST.Service
{

XData UrlMap
{
<Routes>
	<Route Url="/sendreport" Method="POST" Call="SendReport" />
</Routes>
}

Method SendReport() As %Status
{
	set tSC = $SYSTEM.Status.OK()
	s ^PFTEST="test"
	set jsonRequest = {}.%FromJSON(%request.Content)
	set pRequest = ##class(PATRONUS.Messages.ReportRequest).%New()

	set pRequest.HL7MessageId=jsonRequest.HL7MessageId
	set pRequest.ConsultId=jsonRequest.ConsultId
	set pRequest.PDFReport=jsonRequest.PDFReport
	
    
    ;set tSC=##class(Ens.Util.JSON).JSONStreamToObject(jsonRequest,.pRequest,pRequest.%ClassName(1),1)
    ;set tSC=##class(Ens.Util.JSON).JSONStreamToObject(%request,.pRequest,pRequest.%ClassName(1),1)

 	set tSC=pRequest.%Save()
 	
 	//CALL ENSEMBLE BPL FOR PROCESSING
 	;set tSC=..SendRequestSync("ReportReceiveBPL",.pRequest)
 	;s ^PFTEST(1)=pRequest.PDFReport
 	//BUILD LOGIC FOR DETERMING RETURN MESSAGE
 	
 	set EnsembleResponse=""
 	;set pResponse=##class(PATRONUS.Messages.ReportResponse).%New()
 	s pResponse=##class(%ZEN.proxyObject).%New()
 	if EnsembleResponse="failed" {
 		set pResponse.StatusFlag=0
 		set pResponse.StatusText="Invalid"
 	}
 	else {
 		set pResponse.StatusFlag=1
 		set pResponse.StatusText=""
 	}
 	
 	set %response.ContentType="application/json"
 	
 	do pResponse.%ToJSON()

 	quit $SYSTEM.Status.OK()
}

}
