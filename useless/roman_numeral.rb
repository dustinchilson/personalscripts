#!/usr/bin/ruby -w

=begin
* Name: roman_numeral.rb
* Description: Converts a number to it's roman numeral equivalent 
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
def romanize(input)
    ints = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    nums = ['M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I']
    result = []
    for i in 0...ints.length
        count = input / ints[i]
        result << nums[i] * count
        input -= ints[i] * count
    end
    result.join ''
end

# Variable Definitions
#

# Main Code
#
while true
    print "Please enter a number between 1 and 4999: "
    input = gets.chomp
    if input == 'exit'
        exit
    end
    begin
        input = Integer(input)
    rescue ArgumentError
        puts "#{input} is not a valid number. Please try again."
        next
    end
    if input < 0 or input > 5000
        puts "#{input} is out of range. Please try again."
        next
    end
    puts romanize(input)
end



