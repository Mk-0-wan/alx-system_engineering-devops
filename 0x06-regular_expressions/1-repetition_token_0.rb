#!/usr/bin/env ruby
# allow repetition of the t where the least value of t is 2 while the max value is 5
puts ARGV[0].scan(/hbt{2,5}n/).join
