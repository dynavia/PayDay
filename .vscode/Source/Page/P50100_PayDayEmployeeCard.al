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
            
            // General Section
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
            
            // Salary Information Section
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
            
            // Personal Tax Credit Section
            group("Personal Tax Credit "){
                
                group("GridLayout"){
                    Caption = '';
                    grid("GroupGrid1"){
                        Caption = '';
                        
                        group("1000")  {
                            Caption = '';
                            field("Personal Tax Credit";"Personal Tax Credit"){
                                Caption = 'PTC';
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
                        }
                        group("1001"){
                            Caption = '';
                            field(PersTaxCredit;PersTaxCredit.Description){
                                Caption = '';
                                Editable = false;
                            }
                        }
                        group("1002"){
                            Caption = '';
                            field("Amount";PersTaxCredit.Amount){
                                Editable = false;
                            }
                        }
                        group("1003"){
                            Caption = '';
                            field("Personal Tax Credit Proportion";"Personal Tax Credit Proportion"){
                                Caption = 'Proportion';
                                BlankZero = true;
                                trigger OnValidate();
                                begin
                                    CalcPersTaxCredit := PersTaxCredit.Amount * ("Personal Tax Credit Proportion" / 100);    
                                end;
                            }
                        }
                        group("1004"){
                            Caption = '';
                            field(CalcPersTaxCredit;CalcPersTaxCredit){
                                Caption = '';
                                BlankZero = true;
                                Editable = false;
                            }
                        }
                    }
                    grid("GroupGrid2"){
                        Caption = '';
                        group("1005"){
                            Caption = '';
                            field("Additional Personal Tax Credit";"Additional Personal Tax Credit"){
                                Caption = 'Additional PTC';
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
                        }
                        group("1006"){
                            Caption = '';
                            field(AddPersTaxCredit;AddPersTaxCredit.Description){
                                Caption = '';
                                Editable = false;
                            }
                        }
                        group("1007"){
                            Caption = '';
                            field("Add. Amount";PersTaxCredit.Amount){
                                Editable = false;
                            }
                        }
                        group("1008"){
                            Caption = '';
                            field("Additional Personal Tax Credit Proportion";"Additional Personal Tax Credit Proportion"){
                                Caption = 'Proportion';
                                BlankZero = true;
                                trigger OnValidate();
                                begin
                                    CalcAddPersTaxCredit := AddPersTaxCredit.Amount * ("Additional Personal Tax Credit Proportion" / 100);  
                                end;
                            }
                        }
                        group("1009"){
                            Caption = '';
                            field(CalcAddPersTaxCredit;CalcAddPersTaxCredit){                                    
                                Caption = '';
                                BlankZero = true;
                                Editable = false;
                            }
                        }
                    }
                }       
            }
            
            // Pension Section
            group("Pension"){
                group("1010"){
                    Caption = '';
                    grid("1011"){
                        Caption = '';
                        group("1012"){
                            Caption = '';
                            field("Pension Fund ID";"Pension Fund ID"){
                                trigger OnValidate();
                                begin
                                    Pension.get("Pension Fund ID");
                                end;
                            }
                        }
                        group("1016"){
                            Caption = '';
                            field("Description2";Pension.Description){
                                Caption = '';
                                Editable = false;
                            }
                        }
                    }
                    grid("1013"){
                        Caption = '';
                        group("1014"){
                            Caption = '';
                            field("Additional Pension Fund ID";"Additional Pension Fund ID"){
                                trigger OnValidate();
                                begin
                                    AddPension.get("Additional Pension Fund ID");
                                end;
                            }
                        }
                        group("1015"){
                            Caption = '';
                            field("Description3";AddPension.Description){
                                Caption = '';
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
        // Records
        Salary : Record "PayDay Salary";
        PersTaxCredit : Record "PayDay Personal Tax Credit";
        AddPersTaxCredit : Record "PayDay Personal Tax Credit";
        Pension : Record "PayDay Pension";
        AddPension : Record "PayDay Pension";
        // Other
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
        if not Pension.get("Pension Fund ID") then
            clear(Pension);
        if not AddPension.get("Additional Pension Fund ID") then
            clear(AddPension);
        CalcPersTaxCredit := PersTaxCredit.Amount * ("Personal Tax Credit Proportion" / 100);
        CalcAddPersTaxCredit := AddPersTaxCredit.Amount * ("Additional Personal Tax Credit Proportion" / 100);  
    end;
}