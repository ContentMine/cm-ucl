# cm-ucl
A repository to openly track progress on table extraction.

## Background
the [EPPICentre at UCL, London](http://eppi.ioe.ac.uk/cms/) has sponsored a collaboration with [The Content Mine](www.contentmine.org) to automatically extract tables from PDFs in the scientific/scholarly literature. 

## Goals
The primary goal is to provide semantic material of high *measurable* quality for use in systematic reviews. The project involves technology development by ContentMine and measurement (metrics) of success by both parties.

## Strategy 

### Material 
Articles will be chosen by UCL from the public scholarly literature to represent "typical" material for systematic reviews. This has been done to reflect the overall spread of publication technology in bio- and medical sciences (Clinical Trials and Neuroscience testing). Each article has a "PubStyle" determined by publisher technology (typsetting, structure, terminology, etc.). Within biomedical UCL has selected a wide a range of PubStyles consistent with project resources rather than cherry-picking PubStyles that are "easy" for the current technology.

### source code
see separate section



### research and metrics
[Chris Hartgerink](https://github.com/chartgerink) will oversee the precise research methodology to ensure that matrics and conclusions are formally justifiable. The primary discussion will occur on this site. As far as possible UCL will select material and CH will create metrics; with PMR deliberately not involved in choice of PubStyles.  The intention will be to give an "objective" assessment of the recall, precision and accuracy of AMI-table.

Metrics will cover several levels:
* conversion of the input stream to Unicode. This covers legacy undocumented fonts (codepoints), diacritics and normalization, ligatures, and other undiscovered problems.
* retrieval of the table area. Too much, too little or "just right".
* retrieval and naming of table sections. Currently we have: "title", "header", "body", "footer"
* retrieval of sub-sections (column headers, row headers, columns, rows)
* retrieval of sub-tables (indentation or sub-grids)
* subscripts and superscripts.
* line-break interpretation
Some of these will may be categorical or Likert-like 

### development
We hope to have an agreed Open corpus by the end of 2017-01. This will be split into parts for development and metrics. Code will be developed against the development-corpus, while the testing corpus will be held back from PMR. Question? How does one do blinding in a n OpenNoteBook project.

## Code
### AMI
ContentMine/PMR has developed tools for extracting data from PDFs, based on [Apache's PDFBox](https://pdfbox.apache.org/), currently in [SVG2XML](https://bitbucket.org/petermr/svg2xml/wiki/Home) and other modules in the toolchain. PMR has developed the AMI-table module, which will be used and refined here. 

### other ContentMine packages
It is not planned to use getpapers and quickscrape at present because te corpus can be manually downloaded.

### PDFBox 
Currently we use PDFBox 1.8, but hope to move to the new Apache PDFBox 2.0.4 (this is non-trivial as the API is different)

### GROBID

The [GROBID package](https://grobid.readthedocs.io/en/latest/) has been developed over several years for extraction of bibliographic data from articles. We believe it covers:
* biblographic data
* list of citations
* abstract structure of document
* identification of tables and figures
* retrieval of figure/table coordinates and captions/title
We will measure the performance of GROBID in identifying tables and their coordinates. If it is satisfactory we may include it as a preprocessor to give coordinates to AMI-table

## Open
All software is Open, compliant with the [OSI license definitions](https://opensource.org/licenses). Software from TheContentMine ("AMI", and other packages ("getpapers", "quickscrape") is generally licenced Apache2 (see this project). Other software will normally be under similar Open Licences - where GPL is used it will be distinct modules that are linked by data files, not program APIs.

The intention is that Data conforms to the [Open Definition](http://opendefinition.org). Since most of the raw data is copyrighted scholarly publications we try to ensure this by using only compliant sources ("CC BY"). However as copyright is the among the most complex and impenetrable and uncertain legislation produced in the Galaxy certainty cannot be guaranteed. 

The intention is, therefore, that all “Open data and content can be freely used, modified, and shared by anyone for any purpose” (Open Definition), BUT we require attribution. If you re-use a program in your software you must acknowledge it. 

## Tidy Data
Hadley Wickham has produced a stunningly simple. clear and revolutionary approach to the semantics of tabular data ["Tidy Data"](http://vita.had.co.nz/papers/tidy-data.pdf). We believe that most of the truly tabular data can be recast to this form and it is a goal of this project to provide the technology within the Open AMI system.


## Open notebook
We intend that this project will be run as [Open Notebook Science](https://en.wikipedia.org/wiki/Open_notebook_science) where all code, data, experiments are open and can be independently validated from the public face of the project. As Jean-Claude Bradley [writes](http://drexel-coas-elearning.blogspot.co.uk/2006/09/open-notebook-science.html):
<blockquote>
... there is a URL to a laboratory notebook that is freely available and indexed on common search engines. It does not necessarily have to look like a paper notebook but it is essential that all of the information available to the researchers to make their conclusions is equally available to the rest of the world
</blockquote>

## copyright issues and choice of material
Because the raw data is the scientific/scholarly literature most of it is copyrighted and the ownership transferred to "publishers". Many of these constructively wish their material to be re-used in new ways, but some oppose this type of mining activity and have threatened legal action or have cut off subscribers. We cannot then take a random selection of material (as we would like) because negotiating rights with publishers is slow, expensive, messy and drains energy. We have therefore selected "open" material and believe that the selection is legally sound. However we note that the scholarly publishing world has very little legal clarity and if we are required to remove material that the publisher claims is "their copyright" we will do so. This may affect the statistics and metrics of the final results. We therefore have to give it wide publicity to ensure that the project is Open.
