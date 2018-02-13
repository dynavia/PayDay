page 50103 "PayDay Salary Card"
{
    PageType = Card;
    SourceTable = "PayDay Salary";
    UsageCategory = Documents;
    AccessByPermission = page "PayDay Salary Card" = X;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                field(ID;ID){}
                field(Description;Description){}
                field(Amount;Amount){}
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