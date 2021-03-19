#!/bin/bash

echo Hello, where should files be copied?
read dir

if [ -d $dir ]
then
    echo Directory $dir exists.
    for f in .*
    do
        ln -sf $f $dir/$f
    done
    for f in .git
    do
        rm -r $dir/.git
        rm $dir/.gitignore
    done
else
    echo Directory $dir does not exist.
    exit 9999
fi

