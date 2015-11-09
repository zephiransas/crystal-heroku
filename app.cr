require "http/server"
require "option_parser"

server_port = 8080
OptionParser.parse! do |opts|
  opts.on("-p PORT", "--port PORT", "define port to run server") do |port|
    server_port = port.to_i
  end
end

server = HTTP::Server.new("0.0.0.0", server_port) do |request|
  HTTP::Response.ok "text/plain", "Hello world, got #{request.path}!"
end

puts "Listening on http://0.0.0.0:#{server_port}"
server.listen
