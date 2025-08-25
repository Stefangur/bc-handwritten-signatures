codeunit 80500 "AMA Upgrade CU1"
{
    Subtype = Upgrade;
    Permissions = tabledata "Sales Shipment Header" = rm;

    trigger OnUpgradePerCompany()
    var
        SalesHeader: Record "Sales Header";
        SalesHeaderArchive: Record "Sales Header Archive";
        SalesShipmentHeader: Record "Sales Shipment Header";
        Tag: Codeunit "Upgrade Tag";
        MyTag: Label 'Signature_UPGRADE2';
    begin
        if Tag.HasUpgradeTag(MyTag) then
            exit;

        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if SalesHeader.FindSet(false) then
            repeat
                if SalesHeader."AMA Signature".HasValue then begin
                    SalesHeader.CalcFields("AMA Signature");
                    SalesHeaderArchive.SetRange("Document Type", SalesHeader."Document Type");
                    SalesHeaderArchive.SetRange("No.", SalesHeader."No.");
                    if SalesHeaderArchive.FindSet(true) then
                        repeat
                            SalesHeaderArchive."AMA Signature" := SalesHeader."AMA Signature";
                            SalesHeaderArchive.Modify();
                        until SalesHeaderArchive.Next() = 0;

                    SalesShipmentHeader.SetCurrentKey("Order No.");
                    SalesShipmentHeader.SetRange("Order No.", SalesHeader."No.");
                    if SalesShipmentHeader.FindSet(true) then
                        repeat
                            SalesShipmentHeader."AMA Signature" := SalesHeader."AMA Signature";
                            SalesShipmentHeader.Modify();
                        until SalesShipmentHeader.Next() = 0;
                end;
            until SalesHeader.Next() = 0;

        SalesHeaderArchive.SetRange("Document Type", SalesHeaderArchive."Document Type"::Order);
        if SalesHeaderArchive.FindSet(false) then
            repeat
                if SalesHeaderArchive."AMA Signature".HasValue then begin
                    SalesHeaderArchive.CalcFields("AMA Signature");
                    SalesShipmentHeader.SetRange("No.", SalesHeaderArchive."No.");
                    if SalesShipmentHeader.FindSet(true) then
                        repeat
                            SalesShipmentHeader."AMA Signature" := SalesHeaderArchive."AMA Signature";
                            SalesShipmentHeader.Modify();
                        until SalesHeader.Next() = 0;
                end;
            until SalesHeaderArchive.Next() = 0;    

        Tag.SetUpgradeTag(MyTag);
    end;
}
