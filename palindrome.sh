#!/bin/bash
#
#palindrome tester
#writen by alberto barreto

echo "The word to be tested is $1"
echo "The results are saved in palindrome.txt"
curl -s localhost:81/palindrome/"$1" > palindrome.txt
