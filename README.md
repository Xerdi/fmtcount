# FMT Count
![CTAN Version](https://img.shields.io/ctan/v/fmtcount)

This is the source for the LaTeX fmtcount package.

The source for the .sty and .def files are in the trunk/ directory.
(The source for the sample files are also in trunk/)

The .ins and .dtx files are created using makedtx
(http://ctan.org/pkg/makedtx)

In the trunk/ directory you can run "make dist" to generate the .dtx
and .ins files (which will be put in the dist/ directory).
Alternatively, you can run makedtx explicitly:

    makedtx -author "Nicola Talbot (inactive), Vincent Belaïche and Erik Nijenhuis" \
            -src "(.+)\.(sty)=>\1.\2" \
            -src "(.+)\.(def)=>\1.\2" \
            -doc fmtcount-manual.tex fmtcount

The Perl script mv2dist moves the .dtx and .ins files from trunk/ to
dist/ additionally substituting in the correct version number and
date.

Once the .dtx and .ins files have been created, the documentation
can be compiled either using the Makefile file in the dist/
directory or explicitly using:

    latex fmtcount.ins

    pdflatex fmtcount.dtx
    makeindex -s gind.ist fmtcount.idx
    makeindex -s gglo.ist -o fmtcount.gls fmtcount.glo
    pdflatex fmtcount.dtx
    pdflatex fmtcount.dtx

Licensed under the LPPL.

Package info: https://ctan.org/pkg/fmtcount
Issues: https://github.com/Xerdi/fmtcount/issues
