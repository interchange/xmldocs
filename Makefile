#
# ICDEVGROUP Documentation makefile
# http://www.icdevgroup.org
# http://www.icdevgroup.org/cgi-bin/cvsweb/xmldocs
#

# Base definitions
SHELL = /bin/sh
export OUTPUT = OUTPUT
export CACHE  = cache
export XML_CATALOG_FILES = $(DOCBOOKDIR)/catalog.xml
DOCBOOKDIR = docbook
XSLT = xsltproc
XSLT_FLAGS = --xinclude
IC_VERSIONS = cvs-head

VPATH = guides

## ## ##
# Future updates (as documentation expands) go here:
GUIDES = $(OUTPUT)/iccattut.html $(OUTPUT)/iccattut
OLINKDBS_UNCHUNKED = $(DOCBOOKDIR)/iccattut-nochunks-targets.db
OLINKDBS_CHUNKED = $(DOCBOOKDIR)/iccattut-chunks-targets.db

BASE_OUTPUT = output-skel image-files support-files css
TREE_STATS = tree-cache tree-reports
# END
## ## ##
#
# Plain "make" cleans up and builds everything. To invoke targets 
# manually, use names from the section above.
# 
# The targets not autobuilt are tree-stats, tags and objlists. They generate
# files in cache/. cache/ contains information derived from IC
# releases.
# When you want to re-generate the cache information (because say,
# CVS update happends), make sure the "sources" directory or symlink
# points to a directory with the release you wish to update (for 
# example, "cvs-head" or "5.2.0"), then run 'make cache'.
# And don't forget to commit updated cache/ files (if any) to docs CVS.

############## No need to modify below ##############


.PHONY: $(BASE_OUTPUT) $(TREE_STATS) cache distclean clean FORCE

all: distclean $(BASE_OUTPUT) $(TREE_STATS) \
	$(OLINKDBS_UNCHUNKED) $(OLINKDBS_CHUNKED) \
	$(GUIDES) final

#
# XML documentation
#
#@echo GOT $*-shortname / $?-all prereqs / $@-output.html / $<-first prereq
$(OUTPUT)/%.html: %.xml $(DOCBOOKDIR)/* OUTPUT
	# Unchunked document
	$(XSLT) $(XSLT_FLAGS) \
	        --stringparam current.docid $* \
	        --stringparam target.database.document ../$(DOCBOOKDIR)/olinkdb.xml \
	        -o $@ \
	        $(DOCBOOKDIR)/html-nochunks.xsl $<

$(OUTPUT)/%: %.xml $(DOCBOOKDIR)/* OUTPUT
	# Chunked document
	$(XSLT) $(XSLT_FLAGS) \
	        --stringparam current.docid $* \
	        --stringparam target.database.document ../$(DOCBOOKDIR)/olinkdb.xml \
	        -o $(OUTPUT)/ \
	        $(DOCBOOKDIR)/html-chunks.xsl $<

#
# OLink databases
#
$(DOCBOOKDIR)/%-nochunks-targets.db: %.xml
	# Generate olink databases for unchunked html files
	$(XSLT) $(XSLT_FLAGS) \
	        --stringparam collect.xref.targets only \
	        --stringparam targets.filename $@ \
	        $(DOCBOOKDIR)/html-nochunks.xsl \
	        $<

$(DOCBOOKDIR)/%-chunks-targets.db: %.xml
	# Generate olink databases for chunked html files
	$(XSLT) $(XSLT_FLAGS) \
	        --stringparam collect.xref.targets only \
	        --stringparam targets.filename $@ \
	        $(DOCBOOKDIR)/html-chunks.xsl \
	        $<

#
# Support files
#
OUTPUT: $(BASE_OUTPUT)

cache: tree-stats objlists tags

objlists:
	# Generate human-readable ctags information
	-for p in $(IC_VERSIONS); do \
		ctags -R -x --languages=perl --perl-kinds=cls sources/$$p/ \
		> $(CACHE)/$$p/.objectlist.perl.txt; \
		ctags -R -x --languages=c --c-kinds=cdf sources/$$p/ \
		> $(CACHE)/$$p/.objectlist.c.txt; \
		cd sources \
	; done

tags:
	# Generate ctags information
	-for p in $(IC_VERSIONS); do \
		ctags -f $(CACHE)/$$p/.tags -R --extra=fq --fields=afikKlmnsSz --line-directives sources/$$p; \
		cd sources \
	; done

tree-stats:
	# Generate stats to bin dump 
	# Only do that when sources/ is populated
	-for p in $(IC_VERSIONS); do \
		mkdir -p $(CACHE)/$$p; \
		./bin/stattree sources/$$p \
	; done

tree-reports:
	# Make report from $(OUTPUT)/<ver>/.cache.bin
	for p in $(IC_VERSIONS); do \
		mkdir -p $(CACHE)/$$p; \
		./bin/mkreport cache/$$p \
	; done

tree-cache:
	# Copy tree stats to $(OUTPUT)
	-for p in $(IC_VERSIONS); do \
		cp -a $(CACHE)/$$p $(OUTPUT) \
	; done

output-skel:
	# Mirror cache/ structure in output (actually, determine releases)
	mkdir -p $(OUTPUT)
	for p in $(IC_VERSIONS); do \
	  mkdir -p $(OUTPUT)/$$p \
	; done
	mkdir -p $(OUTPUT)/images
	mkdir -p $(OUTPUT)/files

image-files: $(OUTPUT)/images
	# Images
	#cp images/*.{png,gif,jpg,jpeg} $(OUTPUT)/images/
	-cp images/*.png $(OUTPUT)/images/

support-files:
	# Copy support files
	cp -a files/* $(OUTPUT)/files/
	cp bin/dbgen $(OUTPUT)/files/
	cd files; for p in *; do \
		if test "$$p" != "CVS"; then \
			if test -d "$$p"; then \
				tar cf ../$(OUTPUT)/files/$$p.tar $$p; \
				tar zcf ../$(OUTPUT)/files/$$p.tgz $$p; \
				tar jcf ../$(OUTPUT)/files/$$p.tbz2 $$p \
			; fi \
		; fi \
	; done

css:
	# Copy css definitions
	cp $(DOCBOOKDIR)/*.css $(OUTPUT)/

#
# sources/ directory related
# TODO Make target that conveniently checks out all IC releases from CVS,
# sets them in appropriate directories under cache/ and runs the tree
# statistics generator.

#
#
#
distclean clean:
	-rm -r $(OUTPUT)
	-rm $(DOCBOOKDIR)/*.db
	-for p in $(IC_VERSIONS); do \
		  rm $(CACHE)/$$p/* \
	; done

final:
	-rm -r `find $(OUTPUT) -name CVS`

FORCE: ;

