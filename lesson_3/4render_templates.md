## How do I render templates?

**View templates** contain text converted into HTML before it sent back as a response to a browser. There are many *templating languages,* each with their own way of generating HTML and embedding dynamic values. 

- an example of this is changing the `<title>` of each page dynamically on each page using ruby code, then that value is inserted into a template before its sent to a user.

**ERB** or embedded ruby, embeds bits of Ruby code into another file. This is the default templating language in Ruby on Rails 

```erb
<h1><%= @title %></h1>
```

- above prints a dynamic value in a `h1` HTML header. When the template is rendered the ERB tags are replaced by the value for `@title`. 

if `title == "Book Viewer"`:

```erb
<h1>Book Viewer</h1>
```

### grow your own framework article

**view templates:** separate files that allow us to pre-process on the server side in a programming language like ruby, then translate the programming code into a string (usually HTML) to return to the client   

**ERB** or embedded ruby is a popular templating library engine that allows us to embed ruby directly into HTML. ERB processes a special syntax that mixes into HTML and produces a final 100% HTML string. And nothing else.

ERB also processes entire files as well as strings.

to use ERB we must:

-  `require 'erb'`
-  instantiate an ERB template object, and pass in a string using the special syntax which mixes ruby with HTML:
   -  `<%= %>` evaluates ruby code and include its return value in the HTML output. Method invocations are good for this tag
   -  `<% %>` only evaluates the ruby code but doesn't include the return value in the HTML output. Use this tag for method definitions
-  Invoke the ERB instance method `result` which gives us 100% HTML string

```ruby
require 'erb'
def random_number
	(0..9).to_a.sample
end
content1 = ERB.new("<html><body><p>The number is: <%= random_number %>!</p></body></html>")
=> #<ERB:0x007fa2d211d470 ... >

content1.result
=> "<html><body><p>The number is: 7!</p></body></html>"
```

a sample of an `example.erb` file

```html
<% names = ['bob', 'joe', 'kim', 'jill'] %>

<html>
  <body>
    <h4>Hello, my name is <%= names.sample %></h4>
  </body>
</html>
```

a sample of a ruby file using the `example.erb` file

```ruby
require 'erb'

template_file = File.read('example.erb')
erb = ERB.new(template_file)
erb.result

# => <html><body><h4>Hello, my name is jill</h4></body></html>
```

### more templates

- Every Ruby object stores instance variables in a Binding object.

- binding is used for the storage of instance variables and can be accessed using a private instance method `binding`
- Passing `binding` as an argument to `ERB#result` gives a template **access to all instance variables stored in the binding**.
- only works with instance variables (not local / class)
- calling `erb` fires up the ERB engine. `erb :year` is calling a template file and by default look for the `year` file inside your views directory and expects it to end in the `.erb` extension. For file rendering use a SYMBOL