#!/bin/bash
#
#palindrome tester
#writen by alberto barreto

# Define variables
palindromesvr=$(gcloud compute instances list | grep palindrome-svr | awk '{print $4}')

echo "The word to be tested is $1"
echo "The results are saved in palindrome.txt"
curl -s $palindromesvr:81/palindrome/"$1" > palindrome.txt
