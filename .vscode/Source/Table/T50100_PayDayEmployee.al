table 50100 "PayDay Employee"
{   
    DataPerCompany = true;
    
    fields
    {
        field(1;ID;Integer)
        {
            trigger OnValidate();
            var
                //asdf : Record test

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
        field(9;"Job Percentage";Decimal){}  //Work Proportion
        field(10;"Salary ID"; code[20])
        {
            TableRelation = "PayDay Salary";
            ValidateTableRelation = true;
        }
        field(11;"Personal Tax Credit"; code[20])
        {
            TableRelation = "PayDay Personal Tax Credit";
            ValidateTableRelation = true;            
        }
        field(12; "Personal Tax Credit Proportion"; Decimal){}

        field(13;"Additional Personal Tax Credit"; code[20])
        {
            TableRelation = "PayDay Personal Tax Credit";
            ValidateTableRelation = true;            
        }
        field(14; "Additional Personal Tax Credit Proportion"; Decimal){}
        field(15;"Pension Fund ID";code[20]){
            TableRelation = "PayDay Pension";
            ValidateTableRelation = true;
        }
        field(16;"Additional Pension Fund ID";code[20]){
            TableRelation = "PayDay Pension";
            ValidateTableRelation = true;
            
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