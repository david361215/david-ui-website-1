rm -rf dist 
yarn build 
cd dist 
git init 
git add
git commit -m "update"
git branch -M main
git remote add origin git@github.com:david361215/david-ui-website.git
git push -f -u origin main 
cd -
echo https://fangyinghang.com/gulu-ui-website-1/index.html 