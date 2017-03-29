Class PATRONUS.Services.RESTService Extends %CSP.REST
{

XData UrlMap
{
<Routes>
	<Route Url="/sendreport" Method="POST" Call="SendReport" />
</Routes>
}

ClassMethod SendReport() As %Status
{
	set tSC = $SYSTEM.Status.OK()
	
	set tSC=##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(%request.Content,"PATRONUS.Class.ReportBody",.jsonRequest,$$$YES)
	//add comment
	Set tSC = ##class(Ens.Director).CreateBusinessService("ReportService",.bService)
 	If ($IsObject(bService)) set tSC=bService.ProcessInput(jsonRequest,.pResponse)
 	
 	set %response.ContentType="application/json"
 	
 	do pResponse.%ToJSON()

 	quit $SYSTEM.Status.OK()
}

}
