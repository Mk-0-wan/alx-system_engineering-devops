#!/usr/bin/env ruby
# negative lookahead is in play here
puts ARGV[0].scan(/hb(?!o).{0,4}n/).join
