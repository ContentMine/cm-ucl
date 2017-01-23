# Automating table extraction from scholarly literature

This is a combined project between

```bash
# This is a dependency for grobid
sudo apt-get install libxml2
# Get the latest stable release
wget https://github.com/kermitt2/grobid/archive/grobid-parent-0.4.1.zip
unzip grobid-parent-0.4.1.zip

# Build grobid
cd grobid-parent-0.4.1/
mvn clean install

# find the jar file
java -jar grobid-core/target/grobid-core-0.4.1.one-jar.jar
```

In order to run `grobid` over the corpus collected (it is quite the extensive command, but will be implemented in backend).

```bash
java -jar grobid-grobid-parent-0.4.1/grobid-core/target/grobid-core-0.4.1.one-jar.jar -gH grobid-grobid-parent-0.4.1/grobid-home/ -dIn corpus/ -dOut corpus-grobid/ -exe processFullText
```

# Table recall

## `grobid`

```bash
find corpus-grobid -type f -name '*.tei.xml' -print0 | while IFS= read -r -d '' file; do
	printf "%s,%s\n" "$file" $(grep 'type="table"' "$file" | wc -l);
done > data/grobid-tables.csv
```

The filepaths in `grobid-tables.csv` were reverted to just the filenames without extension, so they could be matched with the manual coding.