require "socket"
#requiring socket library part of the ruby language that has a bunch of classes that allows us to create and interact with servers and perform other networking tasks

server = TCPServer.new("localhost", 3003)
# TCPServer.new : creates a TCP server that allows 2 computers to comminicate together
# "localhost" server is going to accept requests that go to localhost
# port 3003: which connection are we using to try and connect to the server

# main appplication code
loop do
  client = server.accept
  # waits until someone tries to accept something from the server
  # when there is someone server.accept accepts their call and opens a connection to the client
  # this returns a client object that can be used to interact with the remote system

  client.puts "HTTP/1.1 200 OK"
  # valid status line
  client.puts "Content-Type: text/plain\r\n\r\n"
  # valid response header value specifying the content type

  # the request_line is the message body:

  request_line = client.gets
  # gets recieves the first line of the request
  # the request is all the text being sent from the client to the server
  # the first line of code will be the GET method, a path and the HTTP version
  # followed by the resource of whatever the client wanted to retrieve from the server

  puts request_line
  # all this program does is prints out the request to our console

  client.puts request_line
  # and the request is sent back to the client

  client.close
  # and then we close the connection
end