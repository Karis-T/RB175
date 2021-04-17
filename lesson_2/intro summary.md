## Introduction

- learn HTTP the 'hard way' without a web framework.
- Know that HTTP ultimately is an exchange of textual information between client and server. This makes troubleshooting easy as we can read the text to see exactly what's happening
- Understand the structure of a request and response and how they're interpreted by software
- know the benefits of higher-level tools that provide a nicer interface for working with HTTP.

## Coding along with this course

This course won't include a database server to keep the server side infrastructure very simple: It is just an **application server:**

![Server zoom application server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/server-zoom-appserver.png)

this course will be spend on understanding the **application code**. However once code is deployed other components do come into play. 

- a class will be called `TCP` when a server is created: This is because TCP is the transport later for HTTP requests

- When we write TCP server they might be called 'HTTP servers' because we're sending HTTP compliant requests / responses using TCP connection: Keep the below image in mind:

  ![Server TCP server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/server-zoom-tcp-ruby.png)

- This diagram suggests that our entire app consists of our TCP server and Ruby code

## Summary

- because HTTP is a *text-based protocol* it is possible to interact with it manually. This however isn't typical
- HTTP is built on top of TCP - a networking layer that handles communication between 2 computers.
- *URLs* are made up of many components:
  - *A scheme*
  - *A host*
  - *A port*
  - *A path*
  - *and parameters*
- *Query parameters* are included in a URL and are appended to a path using `?`. Parameters are specified in the URL using `key=value`
- If more parameters are needed they're appended to the URL using `&`
- HTTP is *stateless*, which means that request is handled separately by the server. If we carefully craft URLs and parameters, we can maintain a sense of 'stateful' interactions that's built on top of HTTP. 