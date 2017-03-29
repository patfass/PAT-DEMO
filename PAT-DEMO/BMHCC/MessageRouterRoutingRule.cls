/// 
Class BMHCC.MessageRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="BMHCC.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="1">
<send transform="PATRONUS.DTL.HL7ToRequestDTL" target="ConsultRequestREST"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
