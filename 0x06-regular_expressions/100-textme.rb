#!/usr/bin/env ruby
# matching the exact work given grouping each pattern individually then collecting each one expected behaviour
puts ARGV[0].scan(/\[from:(\w+|\+?\d+)\] \[to:(\+?\d+)\] \[flags:(.*?)\]/).join(",")
