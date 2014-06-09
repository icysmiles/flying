#!/usr/bin/env ruby

def LongPing(sec)
  ip_addr = "124.89.118.209"
  fork do
    while true do
      STDIN.reopen "/dev/null"
      STDOUT.reopen "/dev/null"
      STDERR.reopen "/dev/null"
      system("ping #{ip_addr}")
      sleep sec
    end
    Process.daemon
  end
end

LongPing(30)
