Class PATRONUS.DTL.ConsultResponseToHL7 Extends Ens.DataTransformDTL [ DependsOn = (PATRONUS.Messages.ConsultResponse, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='PATRONUS.Messages.ConsultResponse' targetClass='EnsLib.HL7.Message' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='"test"' property='target.{PIDgrpgrp().ORCgrp()}' action='set' />
<assign value='"test"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR:PlacerOrderNumber().entityidentifier}' action='set' key='1' />
<assign value='source.ConsultId' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier}' action='set' />
<assign value='source.Message' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).NTE(1):Comment(1)}' action='set' />
</transform>
}

}
