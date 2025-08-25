pageextension 80500 "AMA Ext. Sales Order" extends "Sales Order"
{
    layout
    {
        // addafter(Control1900201301)
        // {
        //     group("AMA Signature Group")
        //     {
        //         usercontrol("AMA SignaturePad"; "AMA SignaturePad")
        //         {
        //             ApplicationArea = All;
        //             Visible = true;
        //             trigger Ready()
        //             begin
        //                 CurrPage."AMA SignaturePad".InitializeSignaturePad();
        //             end;

        //             trigger Sign(Signature: Text)
        //             begin
        //                 Rec.SignDocument(Signature);
        //                 CurrPage.Update();
        //             end;
        //         }

        //     }
        //     field("AMA Signature"; Rec."AMA Signature")
        //     {
        //         Caption = 'Customer Signature';
        //         ApplicationArea = All;
        //         Editable = false;
        //     }
        // }
        
        addfirst(factboxes)
        {
            part("AM Sign Factbox"; "AMA Sign Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
                Visible = true;
            }
        }
    }
}