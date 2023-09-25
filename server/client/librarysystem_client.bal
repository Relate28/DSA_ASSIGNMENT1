import ballerina/io;

courseManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Course createCourseRequest = {code: "dsa612s", name: "Distrubuted Systems and Applications", lecturerName: ["Ms Nshandi", "Isaac", "Mr Simon"]};
    Responds createCourseResponse = check ep->createCourse(createCourseRequest);
    io:println(createCourseResponse);

    Course updateCourseRequest = {code: "ballerina", name: "ballerina", lecturerName: ["ballerina"]};
    Responds updateCourseResponse = check ep->updateCourse(updateCourseRequest);
    io:println(updateCourseResponse);

    string getCourseByCodeRequest = "ballerina";
    Course getCourseByCodeResponse = check ep->getCourseByCode(getCourseByCodeRequest);
    io:println(getCourseByCodeResponse);

    string deleteCourseRequest = "ballerina";
    Responds deleteCourseResponse = check ep->deleteCourse(deleteCourseRequest);
    io:println(deleteCourseResponse);
    stream<

Course, error?> getAllCoursesResponse = check ep->getAllCourses();
    check getAllCoursesResponse.forEach(function(Course value) {
        io:println(value);
    });
}
