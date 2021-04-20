## What is Sinatra & Web Frameworks?

**Sinatra** is a Rack-based web development framework. Frameworks come with many 'out of the box' features designed to make web development easier. The ease of use however hides power.

rack-based implies that it's uses Rack to connect to a Web server, like WEBrick. Rack and WEBrick can be used to form a rack application. 

Sinatra uses a set of conventions for where to place your app code. It has built in abilities for:

- route browser 
- view templates
- other convenient features such as specialized custom ones
- route browser requests to our code
- Render templates as a response
- leanest version of Ruby on Rails
- Good for simple, lightweight applications
- fast low memory requirements

**At its core** Sinatra is just *ruby code connecting to a TCP server, handling requests and sending back responses all in a HTTP-compliant string format.*

![img](https://da77jsbdz4r05.cloudfront.net/images/working_with_sinatra/server-zoom-sinatra.png)