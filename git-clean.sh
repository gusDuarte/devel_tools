git verify-pack -v  .git/objects/pack/pack-9fcd5bac90f03e23983a98aa8900a41597053e5f.idx | sort -k 3 -n
git rev-list --objects --all | grep 82c99a3e86bb1267b236a4b6eff7868d97489af1
git log --oneline --branches -- git.tgz
git filter-branch -f --index-filter 'git rm --ignore-unmatch --cached git.tgz' -- 072ce62158c401d2c2fff08cd944de08bfdd25c3
