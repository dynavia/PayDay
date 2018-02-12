table 50101 "PayDay Salary"
{
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
        myInt : Integer;

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