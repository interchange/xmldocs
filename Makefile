#
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

#VPATH       = guides refs howtos glossary
.SILENT:
.PHONY: all skel
.PHONY: refs
.PHONY: cache clean-cache up-all up-%
.PHONY: clean distclean


#############################################################
# Complete build
all: skel refs howtos/howtos.xml glossary/glossary.xml

#############################################################
# Skel
skel: $T $O $O/files $O/images
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
	rm -rf `find $@ -name CVS`
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
	rm -rf `find $@ -name CVS`
$O/xmldocs.css: docbook/xmldocs.css $O
	echo "U     $@/"
	cp $< $@


#############################################################
# Cleaning
clean:
	-rm -rf $O
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
up-all cvs-sources srcs: $(foreach icver,$(IC_VERSIONS),sources/$(icver)/) $T
	for p in $(IC_VERSIONS); do      \
		bin/coup -u $$p                \
	; done
up-% cvs-%: sources/%
	bin/coup -u $(subst sources/,,$<)

#############################################################
# Cache files
cache caches: 
cache/%/.cache.bin: sources/%
	echo "U     $@"
	bin/stattree $<
clean-cache:
	-rm -rf cache/*/.cache.bin


#############################################################
# Reference .xmls
refs: BOTH = --both
refs: bin/refs-autogen $(foreach stype,$(SYMBOL_TYPES),refs/$(stype).xml)
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
#guides: $(OUTPUT)/images $(OUTPUT)/files \
#  $(patsubst guides/%.xml,OUTPUT/%.html,$(wildcard guides/*.xml))  \
#  $(patsubst guides/%.xml,OUTPUT/%,$(wildcard guides/*.xml))
#
#refs: $(OUTPUT)/images $(OUTPUT)/files
#	make $(OUTPUT)/pragmas.html $(OUTPUT)/pragmas $(OUTPUT)/pragmas.man
#	make $(OUTPUT)/globvars.html $(OUTPUT)/globvars $(OUTPUT)/globvars.man
#	make $(OUTPUT)/usertags.html $(OUTPUT)/usertags $(OUTPUT)/usertags.man
#	make $(OUTPUT)/systemtags.html $(OUTPUT)/systemtags $(OUTPUT)/systemtags.man
#	make $(OUTPUT)/uitags.html $(OUTPUT)/uitags $(OUTPUT)/uitags.man
#
## Unchunked documents
#$(OUTPUT)/%.html: %.xml $(OUTPUT)/xmldocs.css
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam current.docid $*                                 \
#	--stringparam target.database.document ../docbook/olinkdb-nc.xml  \
#	-o $@ docbook/html-nochunks.xsl $<
#
## Man pages
#$(OUTPUT)/%.man: %.xml
#	mkdir -p $(OUTPUT)/man
#	$(XMLTO) $(XMLTO_FLAGS)                                        \
#	-x docbook/reference.xsl                                       \
#	-o $(OUTPUT)/man/                                              \
#	man $<
#
## Chunked documents
#$(OUTPUT)/%: %.xml $(OUTPUT)/xmldocs.css
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam current.docid $*                                 \
#	--stringparam target.database.document ../docbook/olinkdb-c.xml  \
#	-o $@/ docbook/html-chunks.xsl $<
#	touch $@
#
#
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
