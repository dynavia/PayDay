table 50100 "PayDay Employee"
{   
    DataPerCompany = true;
    
    fields
    {
        field(1;ID;Integer)
        {
            trigger OnValidate();
            var

            begin                
                // ná í nafn úr þjóðskrá jafnvel
            end;
        }
        field(2;Name;Text[250]){}
        field(3;Address;Text[250]){}
        field(4;City;Text[250]){}
        field(5;"Postal Code";Code[10]){}
        field(6;Country;code[10])
        {
            TableRelation = "Country/Region";
            ValidateTableRelation = true;
        }
        field(7;Title; Text[250]){}
        field(8;Active;Boolean){}
        field(9;"Job Percentage";Decimal){}
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