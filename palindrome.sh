#!/bin/bash
#
#palindrome tester
#writen by alberto barreto

# Define variables

echo "The word to be tested is $1"
echo "The results are saved in palindrome.txt"
curl -s $palindromesvr:81/palindrome/"$1" > palindrome.txt
