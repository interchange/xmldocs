
# ICDEVGROUP Documentation Makefile
# http://www.icdevgroup.org
# http://www.icdevgroup.org/cgi-bin/cvsweb/xmldocs
# 
# Davor Ocelic, docelic@icdevgroup.org
#


#############################################################
# Base definitions
IC_VERSIONS = 4.6.0 4.8.0 5.0.0 5.2.0 cvs-head
SYMBOL_TYPES= pragmas globvars usertags uitags systemtags
SHELL       = /bin/sh
export O    = OUTPUT
export T    = tmp
export XCF  = docbook/catalog.xml
DC          = "/etc/xml/catalog"

# XSLT processor-specific
PSR         = xsltproc
PSR_FLAGS   = --xinclude --nonet

VPATH       = guides refs howtos glossary
.SILENT:
.PHONY: all complete skel clean distclean
.PHONY: guides refs howtos
.PHONY: refxmls
.PHONY: cache caches clean-cache up-all up-%

#############################################################
# Complete build
all: skel refxmls howtos/howtos.xml glossary/glossary.xml
complete: skel srcs caches all


#############################################################
# Group targets
#guides: $(foreach doc,$(subst .xml,,$(shell find guides -name '*.xml'| awk -F/ '{ print $$2 }')),$O/$(doc).html $O/$(doc))
#howtos: $(foreach doc,$(subst .xml,,$(shell find howtos -name '*.xml'| awk -F/ '{ print $$2 }')),$O/$(doc).html $O/$(doc))
#refs: $(foreach doc,$(subst .xml,,$(shell find refs -name '*.xml'| awk -F/ '{ print $$2 }')),$O/$(doc).html $O/$(doc))


#############################################################
# Standard targets
$O/%.html: %.xml skel
	echo "C     $@"
	$(PSR) $(PSR_FLAGS)                                                \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $@ docbook/html-nochunks.xsl $<
$O/%: %.xml skel
	echo "C     $@/"
	$(PSR) $(PSR_FLAGS)                                                \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-c.xml  \
	  -o $@/ docbook/html-chunks.xsl $<


#############################################################
# Skel
skel: $T $O $O/files $O/images $O/xmldocs.css
$T:
	echo "U     $T/"
	mkdir -p $T
$O:
	echo "U     $O/"
	mkdir -p $O
$O/files: $O $(shell find files)
	echo "U     $@/"
	rm -rf $@/
	cp -a files $O/
	#rm -rf `find $@ -name CVS`
	cp bin/dbgen $O/files/
	cd files; for p in *; do                                  \
	  if test "$$p" != "CVS"; then                            \
	    if test -d "$$p"; then                                \
	      cp -a $$p ../$O/files/;                             \
	      tar --exclude=CVS -cf ../$O/files/$$p.tar $$p;      \
	      tar --exclude=CVS -zcf ../$O/files/$$p.tar.gz $$p;  \
	      tar --exclude=CVS -jcf ../$O/files/$$p.tar.bz2 $$p  \
	    ; fi                                                  \
	  ; fi                                                    \
	; done
$O/images: $(shell find images)
	echo "U     $@/"
	rm -rf $@/
	cp -a images $O/
	#rm -rf `find $@ -name CVS`
$O/xmldocs.css: docbook/xmldocs.css $O
	echo "U     $@"
	cp $< $@


#############################################################
# Cleaning
clean:
	-rm -rf $O
clean-cache:
	-rm cache/*/.cache.bin
distclean: clean
	-rm -rf $T
	-rm -rf {refs,glossary}/*.xml


#############################################################
# sources/ directory management
sources:
	echo "U     $@/"
	mkdir -p $@
sources/%: sources $T
	bin/coup $(subst sources/,,$@)
up-all cvs-sources srcs cvsrcs cvs cvss: sources $T
	for p in $(IC_VERSIONS); do      \
	  bin/coup -u $$p                \
	; done
up-% cvs-%: sources/% $T
	bin/coup -u $(subst sources/,,$<)


#############################################################
# Cache files
cache caches: $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin) $T
cache/%/.cache.bin: sources/%
	echo "U     $@"
	bin/stattree $<


#############################################################
# Reference .xmls
# Silly, rewrite this, I forgot about $*
refxmls: BOTH = --both
refxmls: bin/refs-autogen $(foreach stype,$(SYMBOL_TYPES),refs/$(stype).xml)
	:
$T/%.list: BNAME = $(subst $T/,,$@)
refs/%.xml: BNAME = $(subst refs/,,$@)
$T/%.list: FNAME = $(subst .list,,$(BNAME))
refs/%.xml: FNAME = $(subst .xml,,$(BNAME))
$T/%.list refs/%.xml: bin/refs-autogen $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin)
	bin/refs-autogen -g $(FNAME) -o $@ $(BOTH) $(IC_VERSIONS)


#############################################################
# One-shot targets # XXX possible to 'compress' into single rule?
glossary/glossary.xml: $(shell find glossary/ -regex '.+[^(\.xml)]$$')
	bin/generic-autogen glossary
howtos/howtos.xml: $(shell find howtos/ -regex '.+[^(\.xml)]$$')
	bin/generic-autogen howtos


## Man pages
#$(OUTPUT)/%.man: %.xml
#	mkdir -p $(OUTPUT)/man
#	$(XMLTO) $(XMLTO_FLAGS)                                        \
#	-x docbook/reference.xsl                                       \
#	-o $(OUTPUT)/man/                                              \
#	man $<
##
## OlinkDBs
##
## OlinkDB information for unchunked parts
##tmp/olinkdbs: $(LTMPDIR) \
##  $(patsubst guides/%.xml,$(LTMPDIR)/%-c.db,$(wildcard guides/*.xml))  \
##  $(patsubst guides/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard guides/*.xml)) \
##  $(patsubst refs/%.xml,$(LTMPDIR)/%-c.db,$(wildcard refs/*.xml))  \
##  $(patsubst refs/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard refs/*.xml))
##	touch tmp/olinkdbs
#$(LTMPDIR)/olinkdbs: $(LTMPDIR)
#	make $(patsubst guides/%.xml,$(LTMPDIR)/%-c.db,$(wildcard guides/*.xml))
#	make $(patsubst guides/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard guides/*.xml))
#	make $(patsubst refs/%.xml,$(LTMPDIR)/%-c.db,$(wildcard refs/*.xml))
#	make $(patsubst refs/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard refs/*.xml))
#	touch $(LTMPDIR)/olinkdbs
#
#$(LTMPDIR)/%-nc.db: %.xml $(LTMPDIR)
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam collect.xref.targets only                        \
#	--stringparam targets.filename $@                              \
#	docbook/html-nochunks.xsl $<
#	tail +2 $@ > $(LTMPDIR)/tail
#	mv $(LTMPDIR)/tail $@
#
## OlinkDB information for chunked parts
#$(LTMPDIR)/%-c.db: %.xml $(TMPDIR)
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam collect.xref.targets only                        \
#	--stringparam targets.filename $@                              \
#	docbook/html-chunks.xsl $<
#	tail +2 $@ > $(LTMPDIR)/tail
#	mv $(LTMPDIR)/tail $@
#
#	TODO:
#	- make cache
#	- make sources <-- sources as phony, sources-dir creates source/
#	- s/U/C/ when files are overriden unconditionally
#	- why make $O/iccattut.html goes some things twice
#	- make guides/refs/howtos doesn't see proper deps
#

# Not needed right now
# ctags -R -x --languages=perl --perl-kinds=cls sources/$$p/ \
# > cache/$$p/.objectlist.perl.txt; \
# ctags -R -x --languages=c --c-kinds=cdf sources/$$p/ \
# > cache/$$p/.objectlist.c.txt; \
# ctags -f cache/$$p/.tags -R --extra=fq --fields=afikKlmnsSz --line-directives sources/$$p \
#
#mkreport: $(LTMPDIR)/mkreport $(LTMPDIR)
#./bin/mkreport $(IC_VERSIONS)
#  touch $(LTMPDIR)/mkreport
#
