#!/bin/bash


for i in `apt-cache depends sugar-environment`; do
    if [ "$i" != "Depends:" ] && [ "$i" != "Depende:" ];
    then
        echo $i
        dpkg-repack $i
    fi
done

for i in `apt-cache depends sugar-default-activities`; do
    if [ "$i" != "Depends:" ] && [ "$i" != "Depende:" ];
    then
        echo $i
        dpkg-repack $i
    fi
done

dpkg-repack python-gobject
dpkg-repack python-gobject-2
dpkg-repack ceibal-desktop
dpkg-repack ceibal-desktop-data	
dpkg-repack metacity	
