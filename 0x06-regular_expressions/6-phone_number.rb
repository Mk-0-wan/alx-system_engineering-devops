#!/usr/bin/env ruby
# getting the correct phone number pattern
puts ARGV[0].scan(/^[^\D]{10}$/).join
