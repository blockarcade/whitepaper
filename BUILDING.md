# Building

## macOS

Start by installing [MacTeX](https://tug.org/mactex/mactex-download.html). This is a huge install and it will take some time. 

Once this is finished installing you need to add the binaries to your path: 

```
export PATH=/Library/TeX/texbin:$PATH
```

Now install pandoc and pandoc-citeproc

```
brew install pandoc pandoc-citeproc
```

Then run the build script: 

```
./makePDF.sh
```

