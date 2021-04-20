## Introduction

- learn how to work with the web development framework **Sinatra**. 
- Sinatra (like all good web dev frameworks) are productivity tools designed to help web developers speed up the process through automating common tasks
- powerful for seasoned developers but confusing for beginners so pre req tasks must be completed before using Sinatra
- Sinatra can be used to build and deploy a few non-trivial web applications 

## Summary

- **Sinatra** is a small web framework
  - what is a "web framework?"
- **HTTP requests** are handled by Sinatra by creating `routes` :
  - for a path 
  - or set of paths
- We create `routes` using **methods** named after HTTP methods.
  - A `GET` request is handled by a route defined by the `get` Sinatra method
- **view templates** can be written in a template language (eg. `ERB`) .
  - these templates give us a way to define how the HTML response is displayed outside of the route handling it. 
  - Templating languages are often better at describing HTML than ruby alone
- **layout** is a view template surrounding a specific responses' template.
  - layouts provide a way to share HTML used by all view, including links to stylesheets and JS files
- `routes` specify parameters: 
  - using `:` colon 
  - followed by the parameter name:`/chapters/:number`
  - the value is accessible within the route using `params[:number]`
- code in a `before` block is executed *before* the matching route for all requests
- **view helpers** are ruby methods that minimize the amount of ruby code in a view template. 
  - These method are defined in a `helpers` block in Sinatra
- In response to a request a user can be sent to a new location using **redirection**
  - This is done in Sinatra using the `redirect` method
  - redirection is carried out by setting the `Location` header in the response.
  - The client looks at the URL in the `Location` header and sends out a new HTTP GET request for the associated resource, which navigates the client to the new location
- The **files in a project** are identified as either:
  - server-side
  - or client-side code 
  - based on where they will be evaluated