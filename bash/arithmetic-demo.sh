#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label
echo "Please enter first number:"
read firstnum
echo "You entered:"$firstnum
echo "Please enter second number:"
read secondnum
echo "You entered:"$secondnum
echo "Please enter third number:"
read thirdnum
echo "You entered:"$thirdnum 
sum=$((firstnum + secondnum + thirdnum))
product=$((firstnum * secondnum * thirdnum))
echo "Sum of three numbers:"$sum
echo "Product of three numbers:"$product
