pageextension 55001 "AMA Posted Sales Shipment " extends "Posted Sales Shipment"
{
    layout
    {
        addlast(Billing)
        {
            field("AMA Signature"; Rec."AMA Signature")
            {
                Caption = 'Unterschrift';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
