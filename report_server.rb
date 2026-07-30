#! /usr/local/bin/ruby
# report_server.rb
# おみくじサーバ

require 'socket'

OMIKUJI = ["大吉", "中吉", "小吉", "末吉", "凶"]

def server s
  cmd, path, ver = s.gets.split " "

  if cmd == "OMIKUJI"
    kuji = OMIKUJI.sample
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: text/plain; charset=UTF-8\r\n"
    s.print "\r\n"
    pp "OMIKUJI " + kuji
    s.puts kuji
  elsif cmd == "GET"
    if path == "/"
      kuji = OMIKUJI.sample
      s.print "HTTP/1.0 200 OK\r\n"
      s.print "Content-Type: text/html; charset=UTF-8\r\n"
      s.print "\r\n"
      s.puts "<h1>おみくじ</h1>"
      s.puts "<p>今日の運勢は#{kuji}です</p>"
      s.puts "<p>#{Time.now.getlocal('+09:00').strftime('%Y年%m月%d日 %H時%M分')}</p>"
    else
      s.print "HTTP/1.0 404 Not Found\r\n"
      s.print "Content-Type: text/html\r\n"
      s.print "\r\n"
      s.puts "<h1>404 Not Found</h1>"
      s.puts "<p>404 Not Found</p>"
    end
  end
end


gs = TCPServer.open 80
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
    s.close
  end
end
