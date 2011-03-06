#!/usr/bin/ruby -w

=begin
* Name: fibonacci_finder.rb
* Description: Finds the Fibonacci number for a specified postion and lists 
               subsequent numbers.
* Author: Dustin J. Chilson
* Web Site: http://www.lonecanoe.com
* Date Created: 04-04-2009
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
require 'matrix'

# Functions
#
FIB_MATRIX = Matrix[[1,1],[1,0]]
def fib(n)
  (FIB_MATRIX**(n-1))[0,0]
end

# Variable Definitions
#
start = ARGV[0]
start = start.to_i
qnt = ARGV[1]
qnt = qnt.to_i
time = 0

# Main Code
#
qnt.times do
  time = start.to_i
  start += 1
  if ARGV[2] == "-l"
    puts "Fibonacci Position Number " + time.to_s + " equals " + fib(start).to_s
  elsif ARGV[2] == "-s"
    puts fib(start)
  else
    if start-1 == 1
      puts time.to_s + "st - " + fib(start).to_s
    elsif start-1 == 2
      puts time.to_s + "nd - " + fib(start).to_s
    elsif start-1 == 3
      puts time.to_s + "rd - " + fib(start).to_s
    else
      puts time.to_s + "th - " + fib(start).to_s
    end
  end
end
