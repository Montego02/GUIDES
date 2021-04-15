

# goto ssh directory in root
cd ~/.ssh         

# create .ssh if not exist
ssh -T git@github.com || true

# create key (deploy key)
ssh-keygen -t rsa -b 4096 -C "info@qm-ware.de" -f ~/.ssh/github_id_rsa -q -P ""

# register key into agent
chmod 400 ~/.ssh/github_id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_id_rsa


# DID NOT WORK
touch /.ssh/config && chmod 600 /.ssh/config

 
echo -e "HostName github.com\n  IdentityFile ~/.ssh/github_id_rsa\n  PreferredAuthentications publickey\n  User git\n  IdentitiesOnly yes" > ~/.ssh/config

#output public key - copy this key and insert in github / repository / settings / deploy key
cat ~/.ssh/github_id_rsa.pub


# clone repository (ssh tab in github)
git clone git@github.com:Montego02/qmware2.git ~/qmware/PRODUCTION
