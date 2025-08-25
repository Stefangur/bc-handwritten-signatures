codeunit 55001 "SGU Signature Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnInsertShipmentHeaderOnAfterTransferfieldsToSalesShptHeader', '', false, false)]
    local procedure "Sales-Post_OnInsertShipmentHeaderOnAfterTransferfieldsToSalesShptHeader"(SalesHeader: Record "Sales Header"; var SalesShptHeader: Record "Sales Shipment Header")
    begin
        if SalesHeader."AMA Signature".HasValue then begin
            SalesHeader.CalcFields("AMA Signature");
            SalesShptHeader."AMA Signature" := SalesHeader."AMA Signature";
        end;
    end;
    
}
