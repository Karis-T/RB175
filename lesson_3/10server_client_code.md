## Server side vs Client side code

Where is each type of file executed? On the server side or client side?

### Server side Code

`Gemfile`: 

- This is used by bundler (Ruby dependency management system) to install libraries needed to run the program

Ruby files `.rb`

- The core of the Sinatra application. The code within them runs on the server while handling incoming requests

View templates `.erb`

- Ruby code within these files is evaluated on the server to generate the response sent to the client
- Although it contains HTML, it contains dynamic ruby code and still must be processed by a program on the server before its sent to the client.
- templates are often referred to as server-side templates to differentiate them from client-side templates. client-side templates are used by rich JavaScript apps to render a template directly on the client without the need to be processed by a server.

### Client side code

Stylesheets `.css`

- css is interpreted by the web-browser(client) as instructions on how to display a webpage

JavaScript `.js`

- js is evaluated by the JS interpreter within a web browser (client) to add behavior to a webpage



