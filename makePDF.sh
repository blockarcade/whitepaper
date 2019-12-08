#!/bin/sh

# Generate Flow Chart
npx mmdc -c graphs/config.json -i graphs/qrflow.mmd -o graphs/qrflow.png
# Fix issue with line breaks.
# gsed -i 's/<br>/<br\/>/g' graphs/qrflow.pn

# Generate Pie Chart
# npx mmdc -c graphs/config.json -i graphs/qrpie.mmd -o graphs/qrpie.png


pandoc --filter pandoc-citeproc --from markdown --template eisvogel --bibliography=readme.bib -s README.md -o whitepaper.pdf