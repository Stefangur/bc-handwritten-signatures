tableextension 80502 "AMA Sales Shipment Header" extends "Sales Shipment Header"
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
