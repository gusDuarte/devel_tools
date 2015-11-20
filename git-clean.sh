#!/bin/bash

#http://git-scm.com/book/en/v2/Git-Internals-Maintenance-and-Data-Recovery#Removing-Objects

echo "Obtengho el HASH de los blobs grandes ..."
hashes=`git verify-pack -v .git/objects/pack/pack-* | sort -k 3 -n | tail -2 | cut -d" " -f 1`

echo ""
echo ""
echo "$hashes"
echo ""
echo ""
echo "Ogengo los nombres de los blobs grandes ..."

while read line; do
    name=`git rev-list --objects --all | grep $line | cut -d" " -f 2`
    echo "Filtro $name"
    git filter-branch --force --index-filter "git rm --cached -r --ignore-unmatch $name" --prune-empty --tag-name-filter cat -- --all
    echo""
done <<< "$hashes"

echo "****** Git Garbage Collector ******"
rm -rf .git/refs/original/ 
git reflog expire --expire=now --all 
git gc --prune=now
git gc --aggressive --prune
