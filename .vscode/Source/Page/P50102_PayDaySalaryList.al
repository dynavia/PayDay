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
                field("Fixed Total Amount";"Fixed Total Amount"){}
                field("Salary Type";"Salary Type"){}
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