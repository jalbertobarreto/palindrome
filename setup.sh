#!/bin/bash
#
# Palindrome detector setup script
# 

# Download config.yaml to GCP Cloud Shell
wget -q 'https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/config.yaml'

# Deploy with GCP Deployment Manager
gcloud deployment-manager deployments create palindrome-deployment --config config.yaml && sleep 20

# Create ssh keys
gcloud compute config-ssh --quiet && sleep 20

# Define variables
project=$(gcloud config list --format='text(core.project)' | awk -F: '{print $2}' | sed 's/^ *//') \
&& palindromesvr=$(gcloud compute instances list | grep INTERNAL_IP | awk -F: 'NR==2{print $2}' | sed 's/^ *//g')

# Delete external nat from palindrome-svr
gcloud compute instances delete-access-config --access-config-name="External NAT" --zone=us-central1-a palindrome-svr

# Download palindrome script to bastion-host, then log in to it
gcloud compute ssh --project=$project --zone=us-central1-a bastion-host -- "mkdir /home/$USER/palindrome \
&& curl -s 'https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/palindrome.sh' > /home/$USER/palindrome/palindrome.sh \]
&& chmod +x /home/$USER/palindrome/palindrome.sh \
&& cd /home/$USER/palindrome \
&& sed -i '7ipalindromesvr='"$palindromesvr" palindrome.sh ; bash"
