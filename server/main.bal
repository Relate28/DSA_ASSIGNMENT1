import ballerina/http;
import ballerina/io;

type Course readonly & record {
    string name;
    string code;
    string[] lecturers;
};

type name string;

table<Course> key(name) courses = table [];

// http:localhost:400/course
service /course on new http:Listener(4000) {
    // Array to store all courses
    // private Course[] courses = [];
    // http:localhost:400/course/createCourse
    resource function post createCourse(Course course) returns string {
        io:println(course);
        error? err = courses.add(course);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${course.name} saved successfully`;
    }

    resource function put updateCourse(Course course) returns string {
        io:println(course);
        error? err = courses.put(course);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${course.name} saved successfully`;
    }
    resource function get getAllCourses() returns table<Course> key(name) {
        return courses;
    }

    // get using query parameters
