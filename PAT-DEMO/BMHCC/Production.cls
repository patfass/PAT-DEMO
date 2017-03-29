Class BMHCC.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="BMHCC.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="HL7InboundTCP" Category="ToPatronus" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory"></Setting>
    <Setting Target="Host" Name="TargetConfigNames">ConsultRequestBPL</Setting>
    <Setting Target="Adapter" Name="Port">10700</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
  </Item>
  <Item Name="ConsultRequestREST" Category="ToPatronus" ClassName="PATRONUS.Operations.RESTOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">51246</Setting>
    <Setting Target="Adapter" Name="HTTPServer">10.30.0.50</Setting>
    <Setting Target="Adapter" Name="URL">/api/createconsult</Setting>
  </Item>
  <Item Name="ConsultRequestBPL" Category="ToPatronus" ClassName="PATRONUS.Processes.ConsultRequestBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HL7OutboundTCP" Category="FromPatronus" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">167.251.112.149</Setting>
    <Setting Target="Adapter" Name="Port">10700</Setting>
  </Item>
  <Item Name="ReportReceiveBPL" Category="FromPatronus" ClassName="PATRONUS.Processes.ReportReceiveBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ReportService" Category="FromPatronus" ClassName="PATRONUS.Services.ReportService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
