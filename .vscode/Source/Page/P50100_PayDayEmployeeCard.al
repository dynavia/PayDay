page 50100 "PayDay Employee Card"
{
    PageType = Card;
    SourceTable = "PayDay Employee";
    UsageCategory = Documents;
    AccessByPermission = page "PayDay Employee Card" = X;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ID;ID){}
                field(Name;Name){}
                field(Address;Address){}
                field("Postal Code";"Postal Code"){}
                field(City;City){}
                field(Country;Country){}
                field(Title;Title){}                
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}