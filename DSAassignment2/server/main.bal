import ballerinax/mongodb;
import ballerina/graphql;
import ballerina/log;

type User record{
    string firstname;
    string lastname;
    string id;
    string department;
};


type HOD record{
    string firstname;
    string lastname;
    string id;
    string job title;
    string position;
    string role;
    string department;
};


type Emplyee record{
    string firstname;
    string lastname;
    string id;
    string job title;
    string position;
    string role;
    string department;
};


type Supervisor record{
    string firstname;
    string lastname;
    string id;
    string job title;
    string position;
    string role;
    string department;
};


mongodb:ConnectionConfig mongoConfig = {
    connection: {
        host: "localhost",
        port: 27017,
        auth: {
            username: "",
            password: ""
        },
        options: {
            sslEnabled: false, 
            serverSelectionTimeout: 5000
        }
    },
    databaseName: "performanceManagement"
};

mongodb:Client mongoClient = check new (mongoConfig);

configurable string collectionName = "users";
configurable string collectionName = "hod";
configurable string collectionName = "employee";
configurable string collectionName = "supervisor";




@graphql:ServiceConfig {
    graphiql: {
        enabled: true
    
    }
}

service / on new graphql:Listener(9090){
   
   //using a query
  resource function get getAllUsers() returns string{ 
    var allUsers = check mongoClient->find(collectionName, "performanceManagement", {}, {}, {}, -1, -1, []);
    
    log:printInfo(allUsers.toBalString());

    return [];
  }


   //creating a mutation, using a remote function
   remote function createUser(User newUser) returns string|error{
      map<json> doc = <map<json>>newUser.toJson();

      error? addingNewUser = mongoClient->insert(doc, collectionName, "");
     
     if addingNewUser is error{
        log:printInfo(msg: addingNewUser.message());
         return error("Failed to save user");
     }

     log:printInfo(msg: newUser.firstname + "saved successfully");

     return newUser.firstname + "saved succesfully";
   }

   remote function deleteUser(User newUser) returns string|error{
      map<json> doc = <map<json>>newUser.toJson();

      error? addingNewUser = mongoClient->insert(doc, collectionName, "");
     
     if deletingNewUser is error{
        log:printInfo(msg: deletingNewUser.message());
         return error("Failed to delete user");
     }

     log:printInfo(msg: newUser.firstname + "saved successfully");

     return newUser.firstname + "saved succesfully";
   }

   remote function updateUser(User newUser) returns string|error{
      map<json> doc = <map<json>>newUser.toJson();

      error? addingNewUser = mongoClient->insert(doc, collectionName, "");
     
     if deletingNewUser is error{
        log:printInfo(msg: deletingNewUser.message());
         return error("Failed to update user");
     }

     log:printInfo(msg: newUser.firstname + "saved successfully");

     return newUser.firstname + "saved succesfully";
   }

   

}


