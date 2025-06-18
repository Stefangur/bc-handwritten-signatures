tableextension 80501 "AMA Sales Header Archive" extends "Sales Header Archive"
{
    fields
    {
        field(55000; "AMA Signature"; Blob)
        {
            Caption = 'Customer Signature';
            DataClassification = CustomerContent;
            SubType = Bitmap;
        }
    }
}
