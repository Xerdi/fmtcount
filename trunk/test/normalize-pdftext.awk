# Normalise the text extracted from a test PDF by pdftotext, so that the
# comparison against the reference is about what fmtcount typeset, not about
# where the text extractor happened to break a line.
#
# Poppler changed that: 24.02 extracts "Test 21" as one line, 26.01 splits it
# over two.  The PDF is identical either way, so the test must not care.  It
# does still care about the block structure, which carries meaning (each block
# is one test case), hence blank lines are kept as separators and only the
# line breaks *within* a block are ironed out.
#
# Runs of blank lines collapse into one, leading and trailing blank lines are
# dropped, and horizontal whitespace (form feeds from page breaks included)
# collapses into a single space.

function flush() {
  if (buf != "") {
    print buf
    buf = ""
  }
}

/^[ \t\f]*$/ {
  flush()
  blank = 1
  next
}

{
  if (blank && started) print ""
  blank = 0
  started = 1
  gsub(/^[ \t\f]+|[ \t\f]+$/, "")
  gsub(/[ \t\f]+/, " ")
  buf = (buf == "" ? $0 : buf " " $0)
}

END { flush() }
