page 50102 "PayDay Salary List"
{
    PageType = List;
    SourceTable = "PayDay Salary";
    Editable = false;
    UsageCategory = Documents;
    ApplicationArea = All;
    CardPageId = "PayDay Salary Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID;ID){}
                field(Description;Description){}
                field("Salary Type";"Salary Type"){}
                field("Fixed Total Amount";"Fixed Total Amount"){}
                field("Rate per Hour(Daily)";"Rate per Hour(Daily)"){}
                field("Rate per Hour(Overtime)";"Rate per Hour(Overtime)"){}
                field("Rate per Hour(Extra)";"Rate per Hour(Extra)"){}
            }
        }
        area(factboxes)
        {
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
}