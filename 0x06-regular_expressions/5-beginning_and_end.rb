#!/usr/bin/env ruby
# regex for checking that a three character pattern which will always start with h and end with n
# while still having a any type of character in between them
puts ARGV[0].scan(/^h.{1,}n$/).join
