import ballerina/graphql;
import ballerina/io;
import ballerinax/mongodb;


service /covid19 on new graphql:Listener(9000) {

}

type User record {|
    readonly string id;
    string firstNme;
    string lastName;
    string jobTitle;
    string jobPosition;
    string role;
|};

type Department record {|
    readonly string id;
    string department;
    string objectives;
   
|};

type  Employee record {|
    readonly string id;
    string firstNme;
    string lastName;
    string jobTitle;
    string jobPosition;
    string role;
    string department;
    string kpis;
|};

type KPI record {|
    readonly string id;
    string firstNme;
    string lastName;
    string department;
|};

type HOD record {|
    readonly string id;
    string description;
    string metricUnit;
    string employees;
|};

type Mutation {
  createDepartment(name: String!): Department;
  createObjective(departmentId: ID!, description: String!, weight: Float!): Objective
  createEmployee(firstName: String!, lastName: String!, jobTitle: String!, position: String!, role: String!): Employee
  createKPI(description: String!, metricUnit: String!, value: Float, employeeId: ID!): KPI
  assignEmployeeToSupervisor(employeeId: ID!, supervisorId: ID!): Employee
  gradeKPI(id: ID!, value: Float!): KPI
  # Add more mutations for other actions
}





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
    databaseName: "performanceManagementSystem"
};

mongodb:Client db = check new (mongoConfig);
configurable string usersCollection = "Users";
configurable string departmentCollection = "Departments";
configurable string databaseName = "performanceManagementSystem";

@graphql:ServiceConfig {
    graphql: {
        enabled: true,
    // Path is optional, if not provided, it will be dafulted to `/graphiql`.
    path: "/shopping"
    }
}
service /onlineOrdering on new graphql:Listener(2120) {

    // mutation
    remote function createDepartment(Department newdepartment) returns error|string {
        map<json> doc = <map<json>>newdpartment.toJson();
        _ = check db->insert(doc, departmentCollection, "");
        return string `${newdpartment.name} added successfully`;
    }

     remote function createObjective(departmentId: ID, description: String, weight: Float) returns error|string {
        map<json> doc = <map<json>>newdobjective.toJson();
        _ = check db->insert(doc, objectiveCollection, "");
        return string `${objective.name} added successfully`;
    }

    remote function createEmployee(firstName: String, lastName: String, jobTitle: String, position: String, role: String) returns error|string {
        map<json> doc = <map<json>>newEmployee.toJson();
        _ = check db->insert(doc, employeeCollection, "");
        return string `${employee.name} added successfully`;
    }

    remote function gradeKPI(id: ID!, value: Float) returns error|string {
        map<json> doc = <map<json>>newEmployee.toJson();
        _ = check db->insert(doc, employeeCollection, "");
        return string `${employee.name} added successfully`;
    }
  }


    remote function assignEmployeeToSupervisor(employeeId: ID, supervisorId: ID) returns error|string {

        map<json> newPasswordDoc = <map<json>>{"$set": {"password": updatedUser.password}};

        int updatedCount = check db->update(doc supervisorCollection);
        io:println("Updated Count ", updatedCount);

        if assignedCount > 0 {
            return string `${updatedSupervisor.supervisor} supervisor assigned successfully`;
        }
        return "Failed to assign supervisor";
    }


