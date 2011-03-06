#!/usr/bin/ruby -w

=begin
* Name: pwgenerator.rb
* Description:
* Author: Dustin J. Chilson
* Web site: http://www.lonecanoe.com
* Date Created: 04-05-2009
* License: MIT License
Copyright (c) 2009 Dustin J. Chilson

	Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions...

	The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
=end

# Requires & Includes
#

# Functions
#

# Main Code
#
url = Array.new
num = Array.new
pw1 = Array.new
pw = Array.new

salt = "12080441"

url = ARGV[0].split(//) + ARGV[0].reverse.split(//)
num = salt.split(//) + salt.reverse.split(//)

pw1 = url + num

10.times do |i|
  if i % 2 == 0
    pw[i] = pw1[i]
  elsif i % 5 == 0
    pw[i] = '!'
  else
    pw[i] = pw1[i-(i*2)]
  end
end

puts pw.join
