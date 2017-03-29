Class PATRONUS.DTL.ReportResponseToORU Extends Ens.DataTransformDTL [ DependsOn = (PATRONUS.Messages.ReportRequest, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='PATRONUS.Messages.ReportRequest' targetClass='EnsLib.HL7.Message' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.HL7Message' property='target' action='set' />
<assign value='"1"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:SetIDOBX}' action='set' />
<assign value='"EN"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ValueType}' action='set' />
<assign value='"BASE64PDF"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier}' action='set' />
<assign value='source.ConsultId' property='target.{PIDgrpgrp().ORCgrp().OBXgrp().OBX:ObservationSubID}' action='set' />
<assign value='source.PDFReport' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue(1)}' action='set' />
</transform>
}

}
