echo " - Enter your Git username: "
read username

echo " - Enter your Git e-mail: "
read email

read -rp " - Do you want Git to store your credentials: [Y/n] " response

response=${response:-Y}
response=$(echo "$response" | tr '[:lower:]' '[:upper:]')

git config --global user.name $username
git config --global user.email $email

# Check the response
if [[ "$response" == "Y" ]]; then
    git config --global credential.helper store
fi
