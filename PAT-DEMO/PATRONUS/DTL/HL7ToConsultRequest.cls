Class PATRONUS.DTL.HL7ToConsultRequest Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, PATRONUS.Messages.ConsultRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='PATRONUS.Messages.ConsultRequest' sourceDocType='2.3:ORM_O01' create='new' language='objectscript' >
<assign value='source.{MSH:SendingFacility.namespaceID}' property='target.FacilityId' action='set' />
<assign value='source.{PIDgrp.PID:PatientIDInternalID().ID}' property='target.MRN' action='set' />
<assign value='source.{PIDgrp.PID:PatientName.familyname}' property='target.LastName' action='set' />
<assign value='source.{PIDgrp.PID:PatientName.givenname}' property='target.FirstName' action='set' />
<assign value='..ConvertDateTime(source.{ORCgrp(1).OBRuniongrp.OBRunion.OBR:RequestedDateTime.timeofanevent},"%q","%c(3,,0)")' property='target.RequestTime' action='set' />
<foreach property='source.{ORCgrp(1).OBRuniongrp.NTE()}' key='k1' >
<assign value='$get(Notes)_source.{ORCgrp(1).OBRuniongrp.NTE(k1):Comment}_"/r/n"' property='Notes' action='set' />
</foreach>
<assign value='Notes' property='target.Notes' action='set' />
<assign value='source.%Id()' property='target.HL7MessageId' action='set' />
</transform>
}

}
