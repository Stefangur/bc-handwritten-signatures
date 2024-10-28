page 80500 "AMA Sign Factbox"
{
    Caption = 'Unterschrift';
    PageType = CardPart;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            group("AMA Signature Group")
            {
                Caption = 'Unterschrift Kunde';
                ShowCaption = false;
                usercontrol("AMA SignaturePad"; "AMA SignaturePad")
                {
                    ApplicationArea = All;
                    Visible = true;
                    trigger Ready()
                    begin
                        CurrPage."AMA SignaturePad".InitializeSignaturePad();
                    end;

                    trigger Sign(Signature: Text)
                    begin
                        Rec.SignDocument(Signature);
                        CurrPage.Update(false);
                    end;
                }

            }
            field("AMA Signature"; Rec."AMA Signature")
            {
                Caption = 'Unterschrift Kunde';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
