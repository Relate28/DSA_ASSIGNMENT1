import ballerinax/mongodb;

type User record {|
    readonly int ID;
    string firstName;
    string lastName;
    string jobTitle;
    string position;
    string role;
|};

type UserReq record {
    int ID;
    string firstName;
    string lastName;
    string jobTitle;
    string position;
    string role;
};

