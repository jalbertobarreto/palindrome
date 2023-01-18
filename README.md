# Palindrome detector setup guide
From GCP Cloud Shell run the following command:<br>
wget -q https://raw.githubusercontent.com/jalbertobarreto/palindrome/main/setup.sh && chmod +x setup.sh && ./setup.sh

When prompted, click authorize

Once shell access is granted run ./palindrome.sh "name-to-test"

# Palindrome detector uninstall guide
From GCP Cloud Shell run the following command:<br>
rm setup.sh config.yaml && gcloud deployment-manager deployments delete palindrome-deployment


# Build image for docker
docker build --tag palindrome .

# Run container from image manually
docker run -p 81:81 -d --name palindrome palindrome

# Access from
https://<SERVER-IP>:81/palindrome/<word>
  
# Clean up
docker stop palindrome
docker container rm palindrome\
docker image rm palindrome
