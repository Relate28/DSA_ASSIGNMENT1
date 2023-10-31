 import ballerina/graphql;
import ballerina/io;

 
type serverResponse record {|
    *graphql:GenericResponseWithErrors;
    record {|Response theResponse;|} data;
|};

 
type Response record {
    string result;
};



type User record {
    string firstname;
    string lastname;
    string jobtitle;
    string position;
    string role;
    string kpi;
    string score;
    string grade;
    string objective;
};

type userResponse record {|
  record {|User theUser;|} data;  
|};





graphql:Client graphqlClient = check new ("localhost:9090/Performance_manager");


public function main() returns error? {
    
    io:println(SignIn());
}


function MainMenu() returns string|error{
    io:println("==MAIN MENU== |");
    io:println("\n\n 1) SignIn");
    io:println("\n 2) SignUp");

    string input =io:readln("select an option__:");

    if input == "1" {
        return SignIn();
    }
    else if input == "2" {
        return Register();
    }
    else {
        return MainMenu();
    }

      
}





function Login() returns string|error? {

    string user = io:readln("Enter Password");
    string password = "\""+user;

    string document = " { authentication(username:\"user\") { result } } ";
    string document2 = " { authentication(password:"+password+"\") { result } } ";

    map<json> response = check graphqlClient->execute(document2); 
    json|error resultValue = response.data.authentication.result;

    


    io:println("--<json>");
    io:println(resultValue);
    if resultValue == "user" {
        io:println("Access granted");
    }
    //io:println("--String--");
    //io:println(response.data.authentication.result);

    return "";

}

function SignIn() returns string|error {


io:println("___Login Menu__");

    string user = io:readln("Enter Username");
    string username = "\""+user;

    string pswrd = io:readln("Enter Password");
     
   
    string document = " { getPassword(username:"+username+"\") } ";

    map<json> response = check graphqlClient->execute(document); 
    json|error resultValue = response.data.getPassword;

    io:println("--<json>");
    io:println(resultValue);
    
    if resultValue == "password" {
        io:println("Access granted");
        io:println(menuSelect(user));


    } else {
        io:println("Access Denied");
    }
    //io:println("--String--");
    //io:println(response.data.authentication.result);

    return "";


}

function menuSelect(string usr) returns string|error {

    string user = usr;
    string username = "\""+user;

    string document = " { getPosition(username:"+username+"\") } ";

    map<json> response = check graphqlClient->execute(document); 
    json|error resultValue = response.data.getPosition;

    if resultValue == "supervisor" {
        return SecondMenu(user);

    } 
    else if resultValue == "hod" {
        return hodMenu();
    }
    else if resultValue == "employee" {
        return EmployeeMenu(user);
    }
    else {
        return menuSelect(user);
    }

    

}


function hodMenu() returns string|error{
    io:println("==HOD MENU== |");
    io:println("\n\n 1) Create Objectives");
    io:println("\n 2) Delete Objectives");
    io:println("\n 3) View Total Scores");
    io:println("\n 4) Assign Employee");
   
    string input =io:readln("select an option__:");

    if input == "1" {
        return createObj();
    }
    else if input == "2" {
        return " ";
    }
    else if input == "3" {
        return totalScores();
    }
    else if input == "4" {
        return assign();
    }
    else {
        return MainMenu();
    }

      
}

function SecondMenu(string user) returns string|error{
    io:println("==SuperVisor== |");
    io:println("\n\n 1) Approve KPI");
    io:println("\n 2) Delete KPI");
    io:println("\n 3) Update KPI");
    io:println("\n 4) View Scores");
    io:println("\n 5) Grade KPI");

    string input =io:readln("select an option__:");

    if input == "1" {
        return ApproveKPI(user);
    }
    else if input == "2" {
        return DeleteKPI(user);
    }
    else if input == "3" {
        return UpdateKPI(user);
    }
    else if input == "4" {
        return EmployeeScores(user);
    }
    else if input == "5" {
        return gradeKPI(user);
    }
    else {
        return MainMenu();
    }

      
}


function EmployeeMenu(string user) returns string|error{
    io:println("==Employee MENU== |");
    io:println("\n\n 1) Create KPI");
    io:println("\n 2) Grade Supervisor");
    io:println("\n 3) View Total Scores");
    
    string input =io:readln("select an option__:");

    if input == "1" {
        return CreateKPI(user);
    }
    else if input == "2" {
        return GradeSup(user);
    }
    else if input == "3" {
        return ViewScore(user);
    }
    else {
        return MainMenu();
    }

      
}



function Register() returns string|error{

 string firstName = io:readln("Enter Firstname");  
 string fname = "\""+firstName;

 string lastName = io:readln("Enter lastname"); 
 string lname = "\""+lastName;

 string jobtitle = io:readln("Enter Job Title");
 string jtitle = "\""+jobtitle;

 string position = io:readln("Enter Job Position");
 string psition = "\""+position;

 string role = io:readln("Enter Role");
 string rle = "\""+role;

 string kpi = io:readln("Enter KPI");


 string grade = "";


 string objective = io:readln("Enter Objective");
 string obj = "\""+objective;

 

string document = " { createUser(firstName:"+fname+"\",lastName:"+lname+"\",jobTitle:"+jtitle+"\",Position:"+psition+"\",Role:"+rle+"\",Objective:"+obj+"\") { firstname } } ";

map<json> response = check graphqlClient->execute(document); 


    return "";
}


function createObj() returns string|error {

    string id = io:readln("Enter Objective Number...:");
    string Id = "\""+id;

    
    string obj = io:readln("Enter Objective...:");
    string objective = "\""+obj;

    string document = "{ createObjectives(id: "+Id+"\",obj:"+objective+"\")  }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.createObjectives;

    io:println(resp);

    string input = io:readln("Enter X to exit...");

    if(input == "x") {
        return hodMenu();
    }
    return hodMenu();


}

function totalScores() returns string|error {

    string document = "{ viewTotalScores }";

     map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.viewTotalScores;

    io:println(resp);

    string input = io:readln("Enter X to exit...");

    if(input == "x") {
        return hodMenu();
    }
    return hodMenu();

    

}

function assign() returns string|error {


    string id = io:readln("Enter Employee Id#...:");
    string Id = "\""+id;

    
    string supervisor = io:readln("Enter Supervisors name...:");
    string super = "\""+supervisor;

    string document = "{ assign(empId: "+Id+"\",super:"+super+"\")  }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.assign;

    io:println(resp);

    string input = io:readln("Enter X to exit...");

    if(input == "x") {
        return hodMenu();
    }
    return hodMenu();


}


function EmployeeScores(string sup) returns string|error {

    string supervisor =  sup;
    string super = "\""+supervisor;

    string document = "{ EmployeeScores(super:"+super+"\")  }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.EmployeeScores;

    io:println(resp);

      string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return SecondMenu(sup);
    }

    return SecondMenu(sup);

}

function ApproveKPI(string user) returns string|error {

    string empId = io:readln("Enter Employee id #");
    string id = "\""+empId;

    string status = io:readln("Enter Status");
    string Status = "\""+status;

    string document = "{ ApproveKPI(empId:"+id+"\",status:"+Status+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.ApproveKPI;

    io:println(resp);

    string input = io:readln("Enter X to exit...");

    if(input == "x") {
        return SecondMenu(user);
    }



    return SecondMenu(user);

}


function UpdateKPI(string user) returns string|error {

    string empId = io:readln("Enter Employee id #");
    string id = "\""+empId;

    string kpi = io:readln("Enter KPI");
    string KPI = "\""+kpi;

    string document = "{ updateKPI(empId:"+id+"\",KPI:"+KPI+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.ApproveKPI;

    io:println(resp);

     string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return SecondMenu(user);
    }


    return SecondMenu(user);

}


function gradeKPI(string user) returns string|error {

    string empId = io:readln("Enter Employee id #");
    string id = "\""+empId;

    string kpi = io:readln("Enter Grade");
    string KPI = "\""+kpi;

    string document = "{ gradeKPI(empId:"+id+"\",grade:"+KPI+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.gradeKPI;

    io:println(resp);

     string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return SecondMenu(user);
    }


    return SecondMenu(user);

}



function DeleteKPI(string user) returns string|error {

    string empId = io:readln("Enter Employee id #");
    string id = "\""+empId;

     

    string document = "{ deleteKPI(empId:"+id+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.deleteKPI;

    io:println(resp);

     string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return SecondMenu(user);
    }

    return SecondMenu(user);

}


function CreateKPI(string user) returns string|error {

    string usr = user;
    string username = "\""+usr;

    string kpi = io:readln("Enter KPI");
    string KPI = "\""+kpi;

    string document = "{ createKPI(username:"+username+"\",KPI:"+KPI+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.createKPI;

    io:println(resp);

     string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return EmployeeMenu(user);
    }


    return EmployeeMenu(user);

}

function GradeSup(string user) returns string|error {

    string usr = io:readln("Enter supervisor's name :");
    string username = "\""+usr;

    string kpi = io:readln("Enter Grade");
    string KPI = "\""+kpi;

    string document = "{ gradeSup(username:"+username+"\",KPI:"+KPI+"\") }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.gradeSup;

    io:println(resp);

     string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return EmployeeMenu(user);
    }


    return EmployeeMenu(user);

}
 
function ViewScore(string user) returns string|error {

    string usr =  user;
    string username = "\""+usr;

    string document = "{ viewKPI(username:"+username+"\")  }";
     
    map<json> response = check graphqlClient->execute(document); 
    json|error resp = response.data.viewKPI;

    io:println(resp);

       string input = io:readln("Enter X to exit...");

     if(input == "x") {
        return EmployeeMenu(user);
    }


    return EmployeeMenu(user);

}
