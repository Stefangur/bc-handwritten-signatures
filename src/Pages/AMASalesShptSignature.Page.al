page 55001 "AMA Sales Shpt Signature"
{
    Caption = 'Unterschrift Lieferschein';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Sales Shipment Header";

    layout
    {
        area(content)
        {
            field(Image; Rec."AMA Signature")
            {
                ApplicationArea = All;
                ShowCaption = false;
            }
        }
    }
}


