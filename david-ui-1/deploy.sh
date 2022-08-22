rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "update" &&
git branch -M main &&
git remote add origin git@gitee.com:david361215/david-ui-website.git
git push -f -u origin main &&
cd -
echo https://david361215.gitee.io/david-ui-website/