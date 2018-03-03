page 50104 "PayDay Pers. Tax Credit List"
{
    PageType = List;
    SourceTable = "PayDay Personal Tax Credit";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID;ID){}
                field(Description;Description){}
                field(Amount;Amount){}
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