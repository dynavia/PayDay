page 50101 "PayDay Employee List"
{       
    PageType = List;
    SourceTable = "PayDay Employee";
    UsageCategory = Documents;
    ApplicationArea = All;
    Editable = false;
    CardPageId = "PayDay Employee Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID;ID)
                {
                    
                }
                field(Name;Name)
                {}
                field(Address;Address)
                {}
                field(Title;Title)
                {}
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
            action(TestAction)
            {
                Caption = 'Test Action';
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;
                Image = Activities;
                PromotedCategory = Process;
                
                trigger OnAction();
                var
                    //PadayTest: Record payday
                begin

                    message(format(Today()) + '' + format(Time()));
                end;
            }
        }
    }
}