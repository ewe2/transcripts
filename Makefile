##############################################################################
# Makefile for transcripts
# $Id: Makefile 44 2007-07-12 01:45:44Z ewe2 $
#
#
##############################################################################

# setup

.SUFFIXES: .trs .xml .xsl .html .txt

REPOS=http://isaac.pengsheep.org/svn/transcripts/trunk

# stylesheet stuff here

all: originality testing 

originality: originality.html originality.txt

testing: testing.html testing.txt

originality.html: originality.trs
	-./trs2txt $<

originality.txt: originality.trs
	-./trs2txt --txt $<

testing.html: testing.trs
	-./trs2txt $<

testing.txt: testing.trs
	-./trs2txt --txt $<


.PHONY: help clean updatesvn

# developer stuff here

clean:
	-rm -f *.html *.txt *~

updatesvn:
	svn2cl -i -r HEAD:0 --group-by-day


help:
	@echo "\n\
Usage: \n\
  make target\n\
  where target is one of:\n\
    testing\n\
    originality\n\
  make updatesvn\n\
  make help\n\
  make clean\n\
\n\
"
