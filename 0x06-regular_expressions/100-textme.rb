#!/usr/bin/env ruby
# matching the exact work given
# puts ARGV[0].scan(/((?<=[from:])\w+|\d+)\-1,((?<=[to:])\w+|\d+)\-2,((?<=[flags:])\d+)\-3/).join
# puts ARGV[0].scan(/from:(\w+|\d+)-1,to:(\w+|\d+)-2,flags:(\d+)-3/).join
puts ARGV[0].scan(/\[from:(\w+|\+?\d+)\] \[to:(\+?\d+)\] \[flags:(\S+:\S+:\S+:\S+:\S+)\]/).join(",")
