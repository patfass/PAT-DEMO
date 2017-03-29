Class PATRONUS.Services.ReportService Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	
	set pRequest = ##class(PATRONUS.Messages.ReportRequest).%New()

	set pRequest.HL7MessageId=pInput.HL7MessageId
	//add comment
	set pRequest.ConsultId=pInput.ConsultId
	set pRequest.PDFReport=pInput.PDFReport
	
	set tSC=pRequest.%Save()
	set pOutput=##class(%ZEN.proxyObject).%New()
	
	if pRequest.HL7MessageId'="" {
		set tSC=..SendRequestSync("ReportReceiveBPL",pRequest,.pResponse)
 		set pOutput.StatusFlag=2
 		set pOutput.StatusText=""
	}
	else {
 		set pOutput.StatusFlag=0
 		set pOutput.StatusText="Invalid - HL7MessageId Property is REQUIRED"
 	}
	
	Quit $SYSTEM.Status.OK()
}

}
