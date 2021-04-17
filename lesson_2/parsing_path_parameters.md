## How do I pass path and parameters?

![image-20210417064456269](C:\Users\Karis\AppData\Roaming\Typora\typora-user-images\image-20210417064456269.png)

The protocol is also known as the scheme. Here we split up the values of a URL or request

- the scheme or protocol
- The host
- the port
- and the path



![image-20210417064514679](C:\Users\Karis\AppData\Roaming\Typora\typora-user-images\image-20210417064514679.png)

The port is rarely shown so we are removing that. Here we are adding a query parameter to the URL and passing some information as to how many times we can roll the dice in our app 



![image-20210417064706972](C:\Users\Karis\AppData\Roaming\Typora\typora-user-images\image-20210417064706972.png)

In this URL we want to pass 2 pieces of information as parameters to our query: how many times we can roll the dice and how many sides it has.



![image-20210417064756078](C:\Users\Karis\AppData\Roaming\Typora\typora-user-images\image-20210417064756078.png)

Some apps use this style where every parameter is part of the path instead of query parameters. It doesn't however show the relationship between key and values so we are sticking to the one above.

```ruby
"GET /?rolls=2&sides=6 HTTP/1.1"
http_method == "GET"
path == "/"
params = { "rolls" => "2", "sides" => "6" }
```

In ruby this is ideally how we want to break our request line down into 3 variables:

- the `http_method` variable containing the string `"GET"`
- the `path` variable containing the string `"/"`
- the `params` variable where it is a hash of `{ "rolls" => "2", "sides" => "6"}`
  - The numbers are kept as strings

```ruby
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  ...
```

If there are additional requests when loading a webpage (favicon) use the `next if` ruby line shown above