#! /usr/local/bin/ruby
# server1.rb

require 'socket'
def server s
  cmd, path, ver = s.gets.split " "
  #HTTP/1.0として正しく返答
  #1行目はHTTP/1.0 200 OK
  #2行目　content-type: text/html
  #3行目　空行
  #4行目　コンテンツ
  #5行目　ソケットをクローズ
  
  if path == "/"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    pp "INDEX"
    s.puts "index"
    s.puts "<h1>index</h1>"
  else
    pp "OTHER"
    s.puts "other"
  end
  s.close
  
  # while line = s.gets
  #   pp line
  #   s.puts line
  #   break if line == "\r\n"
  # end
  # s.close
end

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end
