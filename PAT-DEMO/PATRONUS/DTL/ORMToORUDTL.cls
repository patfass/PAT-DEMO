Class PATRONUS.DTL.ORMToORUDTL Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.3:ORM_O01' targetDocType='2.3:ORU_R01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{PIDgrp.PID}' property='target.{PIDgrpgrp(1).PIDgrp.PID}' action='set' />
<assign value='source.{PIDgrp.PV1grp.PV1}' property='target.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1}' action='set' />
<assign value='source.{ORCgrp(1).OBRuniongrp.OBRunion.OBR}' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR}' action='set' />
<assign value='..CurrentDateTime("%q")' property='target.{MSH:DateTimeofMessage.timeofanevent}' action='set' />
<assign value='"ORU"' property='target.{MSH:MessageType.messagetype}' action='set' />
<assign value='"R01"' property='target.{MSH:MessageType.triggerevent}' action='set' />
</transform>
}

}
