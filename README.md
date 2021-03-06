MyChat
=====================

This is the beginnings of an iOS chat application written in Swift.

On launch, a new session request is made to the server which returns a random username.

Request and Response Structure
=====================
The JSON API specification details out the requirements for requests and responses as client and server responsibilities.

In short, both systems MUST communicate with this header: 

```
Content-Type: application/vnd.api+json
```
```
Accept: application/vnd.api+json
```

For more information: [json content negotiation](http://jsonapi.org/format/#content-negotiation)

Session Endpoints
=====================
### Session
#### Create

This endpoint allows a user to begin a session.The response should include a JWT Authorization token header.

Note: A user object is randomly generated by the server when a session is createdusername should be a String, user + random alphanumeric up to 6 characters


Third Party Libraries and Frameworks Used
=====================
### [Alamofire](https://github.com/Alamofire/Alamofire)

Networking framework

### [Swinject](https://github.com/Swinject/Swinject)

Dependency Injection framework

### [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

JSON wrapper

### [RxSwift](https://github.com/ReactiveX/RxSwift)

ReactiveX framework

### [RxTest](https://github.com/ReactiveX/RxSwift/blob/master/Tests/RxTest.swift)

ReactiveX testing framework