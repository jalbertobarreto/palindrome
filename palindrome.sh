#!/bin/bash
#
#palindrome tester
#writen by alberto barreto

# Define variables
palindrome-svr=$(gcloud compute instances list | grep INTERNAL_IP | awk -F: 'NR==2{print $2}' | sed 's/^ *//g')

echo "The word to be tested is $1"
echo "The results are saved in palindrome.txt"
curl -s $palindrome-svr:81/palindrome/"$1" > palindrome.txt
