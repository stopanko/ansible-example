require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  # Add mac address to the output
  # session.print "StepanServer! The time is #{Time.now}. Sent from #{x('ls')}"
  session.print "StepanServer! The time is #{Time.now}. Sent from {{ansible_play_hosts[0]}}"

  session.close
end

# require 'rack'
# app = Proc.new do |env|
#     ['200', {'Content-Type' => 'text/html'}, ["StepanServer! The time is #{Time.now}"]]
# end

# Rack::Handler::WEBrick.run app, :Port => 5678
