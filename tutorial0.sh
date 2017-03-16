#!/bin/bash

cd 
# home
cd workspace/cm-ucl 
cp -R tutorial0  mytest
# make the cproject
norma --project mytest --fileFilter ".*/(.*)\.pdf" --makeProject "(\1)/fulltext.pdf" 
# transform pdf to svg 
norma --project mytest --input fulltext.pdf --transform pdf2svg 

# manually edit svg

# then source mytest1.sh


