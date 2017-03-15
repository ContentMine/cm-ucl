# TUTORIAL on norma conversions of PDF->tables

## NOTE
This gives explict commands for `norma`. They are based on a project `myproject123` but you can use your own name. Note that 
some of the commands have regex-based commands which are sensitive to the shell and may need quoting. They require Java 
(JRE, at least Java 7) to be installed. To check:
```
java -version
```


Within a command the order of the arguments is (generally) irrelevant.

The whole process consists of several `norma` commands run in sequence. These could be put in a bash script or similar language. 

## first phase
This converts creates a PDF-based `CProject` and then creates SVG

### selection of PDFs
The client creates a directory (say myproject123) and copies the PDFs into it. The names should be based on DOIs (not titles)

e.g
```
myproject123
   10.1234.5678.pdf
   10.3456.9876.pdf
   10.2314.6666.pdf
   
   ```
### conversion to `cProject`

`norma converts this to a CProject structure where every PDF is arranged in a separate 'CTree` with the reserved name `fulltext.pdf`

```
myproject123
   10.1234.5678/
       fulltext.pdf
   10.3456.9876/
       fulltext.pdf
   10.2314.6666/
       fulltext.pdf
   
```
This is created with the `move2` option of `norma` NYI

```
norma --project myproject123 --fileFilter (.*).pdf --move2 (\1)/fulltext.pdf --outputDir myproject123
```


### conversion pdf 2 svg

```
norma --project myproject123 --transform pdf2svg --input fulltext.pdf 
```
This outputs a directory tree for each Ctree which contains SVG files for each PDFPage

## manual editing

### editing SVG
Each table must be identified visually and edited with Inkscape to remove all the non-table material. 
There may be 2 or more tables on a page and each must be edited into its own file. These should be in a structure
```
cproject123
    ctree345
        tables/
            table1/
                table.svg
            table2/
                table.svg
            ...
    ctree456
        tables/
            table1/
                table.svg
                ...
            table9/
                table.svg
```
NOTE: We shall automate the extraction of tables in the future

### selection of PNG. 
For visual comparison you will want to extract PNGs from the PDFs. This must be done with a manual image snipping tool
which generates PNGs. Store them in the same directory as the SVG, e.g.

```
cproject123
    ctree345
        tables/
            table1/
                table.png
                table.svg
            table2/
                table.png
                table.svg
            ...
```
## conversion to HTML and CSV tables
The following steps are "automatic"

and consist of chained `norma` commands
### annotation of SVG
This will create annotated SVG (with boxes drawn round the components of the tables - title, header, body, footer
and rows and columns
```
		norma --project myproject123 --fileFilter ^.*tables/table(\\d+)/table(_\\d+)?\\.svg" \
			--outputDir myproject123 \
			--transform svgtable2html")
 ```




        
