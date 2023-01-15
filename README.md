# Palindrome detector setup guide
From GCP Cloud Shell download and run setup.sh running the following command:<br>
wget -s https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/setup.sh && chmod +x setup.sh && ./setup.sh

# Palindrome detecto uninstall guide
From GCP Cloud Shell run the following command:<br>
gcloud deployment-manager deployments delete palindrome-deployment
