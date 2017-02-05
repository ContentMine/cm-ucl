The first [tables.csv] has column names:
```
CTree 	table 	layout 	THBF 	T 	H 	B 	F 	colsplit 	rowsplit 	subtab 	suscript 	legacy 	diacritic 	format 	rotate 	contin 	weird
```
These are (roughly)
* CTree - the CTree (directory) name of the article. Created from the downloaded PDF name, e.g. `10.1007_s00213-015-4198-1` . This directory would contain `fulltext.pdf` 
and many other files
* table. name of the  table described (usually `table%d.svg` or `doubleTable%d.html` or similar
* layout - format of columns, sections, etc. (e.g. Title/Header/Body/Footer is THBF). Probably constant over Pubstyle. May create as regex.
* T title section
* H header section
* B body section
* F footer (notes) section
* colsplit - maximum depth to which columns are split 0 heading for each column; 1 = some columns with column name and parent 2 is normally the maximum depth.
