table 50102 "PayDay Pension"
{

    fields
    {
        field(1;ID;code [20]){}
        field(2;Description;Text[30]){}
        field(3;"Employer Proportion %";Decimal){}
        field(4;"Employee Proportion %";Decimal){}
        field(5;Type;Option){
            OptionMembers = "Standard","Additional";
        }
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