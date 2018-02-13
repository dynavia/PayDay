codeunit 50100 "PayDay Installer"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        //PayDayEmployee : Record "PayDay Employee";
        myAppInfo : ModuleInfo;
    
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);
        //myAppInfo.
        //if CompanyName() = 'Dynavia sf.' then begin
        //    PayDayEmployee.id := 1234;
        //    PayDayEmployee.insert();
        //end;
    end;

    trigger OnInstallAppPerDatabase()
    begin
        
    end;
}