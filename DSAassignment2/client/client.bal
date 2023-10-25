import ballerina/graphql;
import ballerina/io;

type UserResponse record {|
    record {|anydata dt;|} data;
|};

public function main() returns error? {
    graphql:Client graphqlClient = check new ("localhost:2120/performanceManagementSystem");

    string doc = string `
    mutation createDepartment(name: String!){
      createObjective(departmentId: ID!, description: String!, weight: Float!),
      createEmployee(firstName: String!, lastName: String!, jobTitle: String!, position: String!, role: String!),
      createKPI(description: String!, metricUnit: String!, value: Float, employeeId: ID!),
      assignEmployeeToSupervisor(employeeId: ID!, supervisorId: ID!),
      gradeKPI(id: ID!, value: Float!)
    }`;

    UserResponse createUserResponse = check graphqlClient->execute(doc, {"id": "2333", "name": "Simon Muchinenyika", "jobPosition": "HOD", "Department": "Software Development"});

    io:println("Response ", createUserResponse);
}