#!/bin/bash

cd 
# home
cd workspace/cm-ucl 



# make the *.svg.html
norma --project  tutorial --fileFilter ^.*tables/table(\\d+)/table(_\\d+)?\\.svg  --outputDir tutorial --transform svgtable2html
# make the *.svg.csv 
norma --project  tutorial --fileFilter ^.*tables/table(\\d+)/table(_\\d+)?\\.svg  --outputDir tutorial --output table.svg.csv  --transform svgtable2csv
# make the png-svg comparison		
norma --project tutorial --fileFilter ^.*tables/table\\d+$  --output  ./tableRow.html  --htmlDisplay  ^.*/table.png ^.*/table.svg.html
# create Ctree-level menu of all tables
norma --project tutorial --output  tables/tableView.html  --htmlAggregate ^.*tables/table\\d+/tableRow.html
# create project-level menu of all Ctrees
norma --project tutorial --output tableViewList.html  --projectMenu .*/tables/tableView.html

