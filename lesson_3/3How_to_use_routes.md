## How does routing work?

Sinatra makes it very simple to write Ruby code that will run when a user visits a particular URL.

Sinatra has a DSL for defining **routes:**

- routes are how a developer maps a URL pattern to some ruby code:

```ruby
require "sinatra"
require "sinatra/reloader"

get "/" do
  File.read "public/template.html"
end
```

- `require sinatra`: we require Sinatra
- `require sinatra/reloader`: we require Sinatra reloader to reload the app's files every time we load a page. Devlopment is smoother this way
- `get "/" do`: declares the route that matches the URL "/". When a user visits that path on the app. Sinatra executes the block. The blocks return value is then sent to the users browser. The `"/"` string is a pattern that matches the URL request.
- `File.read "public/template.html"` here we are loading the contents of the file at public/template.html and sending it to the browser. This file contains the HTML code of the app.
  - `::read` is a class method of the IO class and is available to File via inheritance. File.read opens the specified file and returns its contents as a string.
- the string returned by `File.read` is returned by the block and sent by Sinatra to the browser in response to a get request for the / route
- routes are matched from top to bottom and will stop until it finds one

### Directories

- `public` folders are devoted for static files - ie the files that DONT change (pdf, txt etc.). Any files in the public folder is assumed to be available to everyone in the world to view. 
  - Sinatra is aware of `public` folder and will automatically look for static files inside this folder
- `views` folders are devoted to template files that are used by sinatra to assemble and render a response to a request. these template files often resemble html files but have added code to render dynamic content inside of them. They're not static
  - Templates are designed to be RESUSED and code makes templates dynamic and will be different when the code runs
  - Sinatra is aware of the `views` folder and will automatically look for templates inside this folder
  - A symbol MUST be passed into `erb` call for it to look for an  `.erb` template in the `views` folder 