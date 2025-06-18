pageextension 80501 "AMA Ext Sales Order Archive" extends "Sales Order Archive"
{
    layout
    {
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
