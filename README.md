# palindrome

# Download config.yaml to GCP Cloud Shell
wget -q 'https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/config.yaml'

# Deploy with GCP Deployment Manager
gcloud deployment-manager deployments create palindrome-deployment --config config.yaml

# delete external nat from palindrome-svr
gcloud compute instances delete-access-config --access-config-name="External NAT" --zone=us-central1-a palindrome-svr

# Download palindrome script to bastion-host, then log in to it
gcloud compute ssh --project= PROJECT_ID --zone=us-central1-a bastion-host -- 'mkdir /home/$USER/palindrome && curl -s 'https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/palindrome.sh' > /home/$USER/palindrome/palindrome.sh && chmod +x /home/$USER/palindrome/palindrome.sh && cd /home/$USER/palindrome ; bash'

# Connect to bastion-host from cloud shell
gcloud compute ssh --project= PROJECT_ID --zone=us-central1-a bastion-host -- 'cd palindrome ; bash'

# Delete Deployment
gcloud deployment-manager deployments delete palindrome-deployment
