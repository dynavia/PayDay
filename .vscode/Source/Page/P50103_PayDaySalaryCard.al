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
                field("Salary Type";"Salary Type"){}
                field("Fixed Total Amount";"Fixed Total Amount"){}
                field("Rate per Hour(Daily)";"Rate per Hour(Daily)"){}
                field("Rate per Hour(Extra)";"Rate per Hour(Extra)"){}
                field("Rate per Hour(Overtime)";"Rate per Hour(Overtime)"){}
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