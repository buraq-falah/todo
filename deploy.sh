set -e
npm run bulid
cd dist
git init
git add -add
git commit -m 'New Deployment'
git push -f https://github.com/buraq-falah/todo.git master:gh-pages
cd- 