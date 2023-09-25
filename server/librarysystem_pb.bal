import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string COURSE_DESC = "0A0C636F757273652E70726F746F1210436F757273654D616E6167656D656E741A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22540A06436F7572736512120A04636F64651801200128095204636F646512120A046E616D6518022001280952046E616D6512220A0C6C656374757265724E616D65180320032809520C6C656374757265724E616D6522240A08526573706F6E647312180A076D65737361676518012001280952076D65737361676522200A0A436F75727365436F646512120A04636F64651801200128095204636F646532F8020A10636F757273654D616E6167656D656E7412440A0C637265617465436F7572736512182E436F757273654D616E6167656D656E742E436F757273651A1A2E436F757273654D616E6167656D656E742E526573706F6E647312440A0C757064617465436F7572736512182E436F757273654D616E6167656D656E742E436F757273651A1A2E436F757273654D616E6167656D656E742E526573706F6E647312490A0F676574436F757273654279436F6465121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A182E436F757273654D616E6167656D656E742E436F7572736512430A0D676574416C6C436F757273657312162E676F6F676C652E70726F746F6275662E456D7074791A182E436F757273654D616E6167656D656E742E436F75727365300112480A0C64656C657465436F75727365121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1A2E436F757273654D616E6167656D656E742E526573706F6E6473620670726F746F33";

public isolated client class librarysytemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, COURSE_DESC);
    }

    isolated remote function createCourse(Course|ContextCourse req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        Course message;
        if req is ContextCourse {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("CourseManagement.courseManagement/createCourse", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function createCourseContext(Course|ContextCourse req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        Course message;
        if req is ContextCourse {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("librarysystem.librarysystem/createCourse", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function updateCourse(Course|ContextCourse req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        Course message;
        if req is ContextCourse {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("librarysystem.librarysystem/updateCourse", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function updateCourseContext(Course|ContextCourse req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        Course message;
        if req is ContextCourse {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("librarysystem.librarysystem/updateCourse", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function getCourseByCode(string|wrappers:ContextString req) returns Course|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("CourseManagement.courseManagement/getCourseByCode", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Course>result;
    }

    isolated remote function getCourseByCodeContext(string|wrappers:ContextString req) returns ContextCourse|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("librarysystem.librarysystem/getCourseByCode", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Course>result, headers: respHeaders};
    }

    isolated remote function deleteCourse(string|wrappers:ContextString req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("librarysystem.librarysystem/deleteCourse", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function deleteCourseContext(string|wrappers:ContextString req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Clibrarysystem.librarysystem/deleteCourse", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function getAllCourses() returns stream<Course, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("librarysystem.librarysystem/getAllCourses", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        CourseStream outputStream = new CourseStream(result);
        return new stream<Course, grpc:Error?>(outputStream);
    }

    isolated remote function getAllCoursesContext() returns ContextCourseStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("librarysystem.librarysystem/getAllCourses", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        CourseStream outputStream = new CourseStream(result);
        return {content: new stream<Course, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class CourseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Course value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|Course value;|} nextRecord = {value: <Course>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class librarysystem.librarysystemCourseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCourse(Course response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCourse(ContextCourse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class CourseManagementRespondsCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendResponds(Responds response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextResponds(ContextResponds response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextCourseStream record {|
    stream<Course, error?> content;
    map<string|string[]> headers;
|};

public type ContextCourse record {|
    Course content;
    map<string|string[]> headers;
|};

public type ContextResponds record {|
    Responds content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: COURSE_DESC}
public type CourseCode record {|
    string code = "";
|};

@protobuf:Descriptor {value: COURSE_DESC}
public type Course record {|
    readonly string code = "";
    string name = "";
    string[] lecturerName = [];
|};

@protobuf:Descriptor {value: COURSE_DESC}
public type Responds record {|
    string message = "";
|};
