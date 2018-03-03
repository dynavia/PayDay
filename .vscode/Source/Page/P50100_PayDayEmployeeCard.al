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
                field(Active;Active){}
                field("Job Percentage";"Job Percentage"){
                    BlankZero = true;
                }
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
            group("Personal Tax Credit "){
                
                //GridLayout = true;
                group("GridLayout"){
                    Caption = '';
                    group("GroupGrid3"){
                        Caption = '';
                        grid("GroupGrid1"){
                            field("Personal Tax Credit";"Personal Tax Credit"){
                            trigger OnValidate();
                            begin
                                if not PersTaxCredit.get("Personal Tax Credit") then begin
                                    clear(PersTaxCredit);
                                    "Personal Tax Credit Proportion" := 0;
                                    CalcPersTaxCredit := 0;
                                end else begin
                                        "Personal Tax Credit Proportion" := 100;
                                        CalcPersTaxCredit := PersTaxCredit.Amount * ("Personal Tax Credit Proportion" / 100);
                                    end;
                            end;
                            }
                            field(PersTaxCredit;PersTaxCredit.Description){
                                Editable = false;
                            }
                            field("Amount";PersTaxCredit.Amount){
                                Editable = false;
                            }
                            field("Personal Tax Credit Proportion";"Personal Tax Credit Proportion"){
                                BlankZero = true;
                                trigger OnValidate();
                                begin
                                    CalcPersTaxCredit := PersTaxCredit.Amount * ("Personal Tax Credit Proportion" / 100);    
                                end;
                            }
                            field(CalcPersTaxCredit;CalcPersTaxCredit){
                                BlankZero = true;
                                Editable = false;
                            }
                        }
                    }
                    group("GroupGrid4"){
                        Caption = '';
                        grid("GroupGrid2"){
                            field("Additional Personal Tax Credit";"Additional Personal Tax Credit"){
                                trigger OnValidate();
                                begin
                                    if not AddPersTaxCredit.get("Personal Tax Credit") then begin
                                        "Additional Personal Tax Credit Proportion" := 0;
                                        CalcAddPersTaxCredit := 0;                                        
                                        clear(AddPersTaxCredit);
                                    end else begin
                                        "Additional Personal Tax Credit Proportion" := 100;
                                        CalcAddPersTaxCredit := AddPersTaxCredit.Amount * ("Additional Personal Tax Credit Proportion" / 100);
                                    end;
                                end;
                            }
                            field(AddPersTaxCredit;AddPersTaxCredit.Description){
                                Editable = false;
                            }
                            field("Add. Amount";PersTaxCredit.Amount){
                                Editable = false;
                            }
                            field("Additional Personal Tax Credit Proportion";"Additional Personal Tax Credit Proportion"){
                                BlankZero = true;
                                trigger OnValidate();
                                begin
                                    CalcAddPersTaxCredit := AddPersTaxCredit.Amount * ("Additional Personal Tax Credit Proportion" / 100);  
                                end;
                            }
                            field(CalcAddPersTaxCredit;CalcAddPersTaxCredit){
                                BlankZero = true;
                                Editable = false;
                            }
                        }
                    }
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
        PersTaxCredit : Record "PayDay Personal Tax Credit";
        AddPersTaxCredit : Record "PayDay Personal Tax Credit";
        CalcPersTaxCredit : Decimal;
        CalcAddPersTaxCredit : Decimal;

    trigger OnAfterGetRecord();
    begin
        if not Salary.get("Salary ID") then
            clear(Salary);
        if not PersTaxCredit.get("Personal Tax Credit") then
            clear(PersTaxCredit);
        if not AddPersTaxCredit.Get("Additional Personal Tax Credit") then
            clear(AddPersTaxCredit); 
        CalcPersTaxCredit := PersTaxCredit.Amount * ("Personal Tax Credit Proportion" / 100);
        CalcAddPersTaxCredit := AddPersTaxCredit.Amount * ("Additional Personal Tax Credit Proportion" / 100);  
    end;
}