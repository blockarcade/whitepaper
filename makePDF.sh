#!/bin/sh
pandoc --filter pandoc-citeproc --variable classoption=twocolumn --bibliography=readme.bib --variable papersize=a4paper -s README.md -o whitepaper.pdf