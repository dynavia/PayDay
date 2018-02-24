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
                field(ID;ID){
                    ShowMandatory = true;
                }
                field(Name;Name){
                    ShowMandatory = true;
                }
                field(Address;Address){}
                field("Postal Code";"Postal Code"){}
                field(City;City){}
                field(Country;Country){}
                field(Title;Title){}                
            }
            group("Salary Information")
            {
                field("Salary Code";"Salary ID"){
                    ShowMandatory = true;
                    
                    trigger OnValidate();
                    begin
                        if not Salary.get("Salary ID") then
                            clear(Salary);
                    end;
                }
                field("Salary Description"; Salary.Description){
                    Editable = false;
                }
                field("Salary Type"; Salary."Salary Type"){
                    Editable = false;
                }
                field("Fixed Total Amount";Salary."Fixed Total Amount"){
                    Editable = false;
                    //Visible = FixedSalaryVisible;
                }
                field("Rate per Hour(Daily)";Salary."Rate per Hour(Daily)"){
                    Editable = false;
                }
                field("Rate per Hour(Overtime)";Salary."Rate per Hour(Overtime)"){
                    Editable = false;
                }
                field("Rate per Hour(Extra)";Salary."Rate per Hour(Extra)"){
                    Editable = false;
                }
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
        Salary : Record "PayDay Salary";
        FixedSalaryVisible : Boolean;

    trigger OnAfterGetRecord();
    begin
        if not Salary.get("Salary ID") then
            clear(Salary)
        else begin
            //FixedSalaryVisible := (Salary."Salary Type" = Salary."Salary Type"::"Fixed");
            //CurrPage.     
        end;     
    end;
}