table 50101 "PayDay Salary"
{
    fields
    {
        field(1;ID;Code[20]){}
        field(2;Description;Text[50]){}
        field(3;"Amount";Decimal){}  //Fixed amount
        field(4;"Rate per Hour(Daily)";Decimal){}
        field(5; "Rate per Hour(Overtime)";Decimal){}
        field(6;"Rate per Hour(Extra)";Decimal){}
        field(7;"Salary Type"; Option)
        {
            OptionMembers = "Fixed","Hourly";
        }
        field(8;"Fixed Total Amount";Decimal){}
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