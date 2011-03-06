#!/usr/bin/ruby -w

=begin
* Name: untitled.rb
* Description:
* Author: Dustin J. Chilson
* Web site: http://www.lonecanoe.com
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

# Functions
#
def cor_coef(x,y,n)
  # Variable Definitions
  #
  xsum = 0.0
  ysum = 0.0
  xy = 0.0
  xsqr = 0.0
  ysqr = 0.0
  top = 0.0
  first = 0.0
  second = 0.0

  # Main Code
  #
  n.times do |i|
    xy += x[i] * y[i]
    xsum += x[i]
    ysum += y[i]
    xsqr += x[i]**2
    ysqr += y[i]**2
  end

  puts ""

  top = (n * (xy)) - ((xsum) * (ysum))
  #puts "top = " + top.to_s
  first = ((n * xsqr) - (xsum**2))
  #puts "first = " + first.to_s
  second = ((n * ysqr) - (ysum**2))
  #puts "second = " + second.to_s
  r = top / Math.sqrt(first * second)
  #puts "r = " + r.to_s

  b1 = top / first
  #puts "b1 = " + b1.to_s
  b0 = (ysum - (b1 * xsum)) / n
  #puts "b0 = " + b0.to_s
  linreg = b0.to_s + "+(" + b1.to_s + "*x)"
  #puts "linreg = " + linreg

  return r, linreg

end

def print_table(x,y,n)
  spacer = "    "
  spacer10 = "   "
  puts "---------------------"
  puts "|" + spacer + "x" + spacer + "|" + spacer + "y" + spacer + "|"
  puts "---------------------"
  n.times do |i|
    if x[i] > 10 and y[i] > 10
      puts "|" + spacer10 + x[i].to_s + spacer  + "|" + spacer10  + y[i].to_s + spacer  + "|"
    elsif x[i] > 10
      puts "|" + spacer10 + x[i].to_s + spacer  + "|" + spacer  + y[i].to_s + spacer  + "|"
    elsif y[i] > 10
      puts "|" + spacer + x[i].to_s + spacer  + "|" + spacer10  + y[i].to_s + spacer  + "|"
    else
      puts "|" + spacer + x[i].to_s + spacer  + "|" + spacer  + y[i].to_s + spacer  + "|"
    end
    puts "---------------------"
  end
end

# Variable Definitions
#
x = Array.new
y = Array.new
x = [3,6,9,12,15]
y = [4,8,12,16,20]
r = 0.0
linreg = ""
n = 5


# Main Code
#
if x.empty? and y.empty?
  puts "How many in the List?"
  n = gets.chomp
  n = n.to_i

  puts "Please type each of the Xs"
  n.times do |i|
    x[i] = gets.chomp
    x[i] = x[i].to_i
  end

  puts "Please type each of the Ys"
  n.times do |i|
    y[i] = gets.chomp
    y[i] = y[i].to_i
  end
end

print_table(x,y,n)
r, linreg = cor_coef(x,y,n)

puts "Your Correlation Coefiicient equals " + r.to_f.to_s
puts "Your Linear Regression fomula in a+bx form is y=" + linreg
puts ""
