

table 50103 "PayDay Personal Tax Credit"
{

    LookupPageId = 50104;

    fields
    {
        field(1;ID;Code[20]){}
        field(2;Description;Text[50]){}
        field(3;Amount;Decimal){}
    }


    keys
    {
        key(PK;ID)
        {
            Clustered = true;
        }
    }
    
    var

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}
