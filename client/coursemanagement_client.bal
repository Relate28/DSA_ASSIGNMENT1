import ballerina/io;

courseManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Course createUsersRequest = {code: "dsa612s", userName: ["Etuna", "Bernadette", "Frieda"]};
    Responds createUsersResponse = check ep->createUsers(createUsersRequest);
    io:println(createUsersResponse);

    Course updateBookRequest = {code: "ballerina", name: "ballerina", lecturerName: ["ballerina"]};
    Responds updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    string getCourseByCodeRequest = "ballerina";
    Course getCourseByCodeResponse = check ep->getCourseByCode(getCourseByCodeRequest);
    io:println(getCourseByCodeResponse);

    string removeBookRequest = "ballerina";
    Responds removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);
    stream<

    });
}
