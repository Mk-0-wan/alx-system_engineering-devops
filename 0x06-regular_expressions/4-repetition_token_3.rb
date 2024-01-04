#!/usr/bin/env ruby
# negative lookahead is in play here
puts ARGV[0].scan(/hb(?!o)t*n/).join
