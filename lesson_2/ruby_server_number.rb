require "socket"

def parse_request(request_line)
  http_method, path, http = request_line.split
  path, params = path.split("?")
  params = params.split("&").map {|param| param.split("=")}.to_h

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"

  params["rolls"].to_i.times { client.puts "<p>#{rand(params["sides"].to_i) + 1}</p>" }

  client.puts"</body>"
  client.puts"</html>"
  client.close
end

# GET /?rolls=2&sides=6 HTTP/1.1
# http_method == "GET"
# path == "/"
# params = { "rolls" => "2", "sides" => "6" }