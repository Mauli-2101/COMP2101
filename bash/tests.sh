#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file
# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file
# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link
# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory
# TASK 4: Add a test to see if the /etc/resolv.conf file is readable
# TASK 5: Add a test to see if the /etc/resolv.conf file is writable
# TASK 6: Add a test to see if the /etc/resolv.conf file is executable
test -e /etc/resolv.conf && echo "/etc/resolv.conf exists" || echo "/etc/resolv.conf does not exist"
test -f /etc/resolv.conf && echo "/etc/resolv.conf exists and is a regular file" || echo "/etc/resolve.conf is not a regular file"
test -h /etc/resolv.conf && echo "/etc/resolv.conf exists and is a symbolic link" || echo "/etc/resolv.conf is not a symbolic link"
test -d /etc/resolv.conf && echo "/etc/resolv.conf exists and is a directory" || echo "/etc/resolv.conf is not a directory"
test -r /etc/resolv.conf && echo "/etc/resolv.conf exists and is readable" || echo "/etc/resolv.conf is not readable"
test -w /etc/resolv.conf && echo "/etc/resolv.conf exists and is writable" || echo "/etc/resolv.conf is not writable"
test -x /etc/resolv.conf && echo "/etc/resolv.conf exists and is executable" || echo "/etc/resolv.conf is not executable"
# Tests if /tmp is a directory
# TASK 4: Add a test to see if the /tmp directory is readable
# TASK 5: Add a test to see if the /tmp directory is writable
# TASK 6: Add a test to see if the /tmp directory can be accessed
[ -d /tmp ] && echo "/tmp is a directory" || echo "/tmp is not a directory"
[ -d /tmp -a -r /tmp ] && echo "/tmp is a directory and is readable" || echo "/tmp is not readable"
[ -d /tmp -a -w /tmp ] && echo "/tmp is a directory and is writable" || echo "/tmp is not writable"
[ -d /tmp -a -a /tmp ] && echo "/tmp is a directory and can be accessed" || echo "/tmp cannot be accessed"
# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age
[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newer than /etc/resolv.conf"
[ /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/resolv.conf is newer than /etc/hosts"
[ ! /etc/hosts -nt /etc/resolv.conf -a ! /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/hosts is the same age as /etc/resolv.conf"

# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests
# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd
# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first number
echo "Please give first number: " 
read firstNumber
echo "Please give second number: "
read secondNumber
[ $((firstNumber%2)) -eq 0 ] && echo "The number is odd" || echo "The number is even"
[ $((secondNumber%2)) -eq 0 ] && echo "The number is odd" || echo "The number is even"
[ $((firstNumber/secondNumber)) -eq 0 ] && echo "The second number is multiple of first number" || echo "Second number is not multiple of first number"
[ $firstNumber -eq $secondNumber ] && echo "The two numbers are the same"
[ $firstNumber -ne $secondNumber ] && echo "The two numbers are not the same"
[ $firstNumber -lt $secondNumber ] && echo "The first number is less than the second number"
[ $firstNumber -gt $secondNumber ] && echo "The first number is greater than the second number"

[ $firstNumber -le $secondNumber ] && echo "The first number is less than or equal to the second number"
[ $firstNumber -ge $secondNumber ] && echo "The first number is greater than or equal to the second number"

# This section demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty
[ -v USER ] && echo "The variable SHELL exists"
export USER="scripting"
[ -v USER ] && echo "The variable USER exists but is empty"
# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
# TASK 4: Use the read command to ask the user running the scrixpt to give us strings to use for the tests
a=1
b=01
[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"
[ $a != $b ] && echo "$a is not aplhanumerically equal to $b" || echo "$a is alphanumerically equal to $b" 
echo "Please enter string1: "
read string1
echo "Please enter string2: "
read string2
[ $string1 = $string2 ] && echo "Strings are equal"
[ $string1 != $string2 ] && echo "Strings are not equal"
