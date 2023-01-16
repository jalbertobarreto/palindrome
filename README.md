# Palindrome detector setup guide
From GCP Cloud Shell run the following command:<br>
wget -q https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/setup.sh && chmod +x setup.sh && ./setup.sh > /dev/null

When prompted, click authorize

Once shell access is granted run ./palindrome.sh "name-to-test"

# Palindrome detector uninstall guide
From GCP Cloud Shell run the following command:<br>
gcloud deployment-manager deployments delete palindrome-deployment
