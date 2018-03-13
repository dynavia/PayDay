page 50105 "PayDay Pension List"
{
    PageType = List;
    SourceTable = "PayDay Pension";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID;ID){                   
                }
                field(Description;Description){}
                field("Employee Proportion %";"Employee Proportion %"){}
                field("Employer Proportion %";"Employer Proportion %") {}
                field(Type;Type){}
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