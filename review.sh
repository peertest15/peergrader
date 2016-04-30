# Replace these values with your Git user and email
username=gituser
useremail=gitemail

mkdir -p /tmp/$1
rm -rf /tmp/$1/*
cd /tmp/$1
mkdir base
mkdir fork
cd base
git clone -q https://github.com/$2.git
cd ../fork
git clone -q https://github.com/$3.git
cd *
rm -rf .git/
mv ../../base/*/.git/ .git/
git config user.name "$username"
git config user.email "$useremail"
git add --all
git commit -q -m "Assignment submission"
git rev-parse HEAD
git push -q https://$username:$4@review.gerrithub.io/a/$2 HEAD:refs/for/master%topic=$1
#git push -q https://$username:$4@review.gerrithub.io/a/$2 HEAD:refs/for/master%topic=testing7
