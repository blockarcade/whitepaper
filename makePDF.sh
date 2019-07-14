#!/bin/sh

pandoc --filter pandoc-citeproc --from markdown --template eisvogel --bibliography=readme.bib -s README.md -o whitepaper.pdf