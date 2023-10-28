import ballerina/graphql;
import ballerina/io;


public function main() returns error? {
    graphql:Client graphQlClient = check new ("localhost:9090");

    string firstName = io:readln("Enter user firstName");
    string lastName = io:readln("Enter user lastName");
    string id = io:readln("Enter user id");
    string deaprtment = io:readln("Enter user department");


    string document = string '
        mutation{
           createUser(newUser:{firstName:"Simon", lastName:"Muchinyenika", id:"1234", department:"Software Engineering"});
           createUser(newUser:{firstName:"Mercy", lastName:"Chitauro", id:"3367", department:"Cyber Security"});
           createUser(newUser:{firstName:"Edward", lastName:"Nepolo", id:"1234", department:"Computer Science"})
      
     }
    ';

     var createUserResponse = check graphQlClient->execute(document, {id, firstName, lastName, department}), "createNewUser", {}, [];
     io:println(...values: createUserResponse);,
     mutation{
           deleteUser(newUser:{firstName:"Simon", lastName:"Muchinyenika", id:"1234", department:"Software Engineering"})
           deleteUser(newUser:{firstName:"Mercy", lastName:"Chitauro", id:"3367", department:"Cyber Security"})
           deleteUser(newUser:{firstName:"Edward", lastName:"Nepolo", id:"1234", department:"Computer Science"})
      
     }
    ';

     var deleteUserResponse = check graphQlClient->execute(document, {id, firstName, lastName, department}), "deletNewUser", {}, [];
     io:println(...values: deleteUserResponse);
}

    










  //string doc = string `
   // mutation createDepartment(name: String!){
    //  createObjective(departmentId: ID!, description: String!, weight: Float!),
    //  createEmployee(firstName: String!, lastName: String!, jobTitle: String!, position: String!, role: String!),
     // createKPI(description: String!, metricUnit: String!, value: Float, employeeId: ID!),
    //  assignEmployeeToSupervisor(employeeId: ID!, supervisorId: ID!),
    //  gradeKPI(id: ID!, value: Float!)
   // }`;

    //UserResponse createUserResponse = check graphqlClient->execute(doc, {"id": "2333", "name": "Simon Muchinenyika", "jobPosition": "HOD", "Department": "Software Development"});

   // io:println("Response ", createUserResponse);
