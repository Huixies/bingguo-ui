rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "更新组件" &&
git branch -M master &&
git remote add origin git@github.com:Huixies/bingguo-ui-website.git &&
git push -f -u origin master &&
cd -
echo http://www.huixies.com/bingguo-ui-website/#/

# git@gitee.com:Huixies/funk-ui.git
# git@github.com:Huixies/vue3-lunzi-website.git
