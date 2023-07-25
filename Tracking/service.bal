import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Tracking",
    id: "Tracking-d82f98ca-fffd-4412-8fdc-c6e55188a6ef"
}
service / on new http:Listener(9090) {

    @display {
        label: "Shipping",
        id: "Shipping-64fc5f28-d768-4e9e-9705-77a067963e28"
    }
    http:Client shippingClient;

    function init() returns error? {
        self.shippingClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
