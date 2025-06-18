codeunit 80500 "AMA Upgrade CU1"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        SalesHeader: Record "Sales Header";
        SalesHeaderArchive: Record "Sales Header Archive";
        Tag: Codeunit "Upgrade Tag";
        MyTag: Label 'Signature_UPGRADE1';
    begin
        if Tag.HasUpgradeTag(MyTag) then
            exit;

        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if SalesHeader.FindSet(false) then
            repeat
                SalesHeader.CalcFields("AMA Signature");
                if SalesHeader."AMA Signature".HasValue then begin
                    SalesHeaderArchive.SetRange("Document Type", SalesHeader."Document Type");
                    SalesHeaderArchive.SetRange("No.", SalesHeader."No.");
                    if SalesHeaderArchive.FindSet(true) then
                        repeat
                            SalesHeaderArchive."AMA Signature" := SalesHeader."AMA Signature";
                            SalesHeaderArchive.Modify();
                        until SalesHeaderArchive.Next() = 0;
                end;
            until SalesHeader.Next() = 0;

        Tag.SetUpgradeTag(MyTag);
    end;
}
