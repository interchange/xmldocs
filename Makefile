#
# ICDEVGROUP Documentation makefile
# http://www.icdevgroup.org
# http://www.icdevgroup.org/cgi-bin/cvsweb/xmldocs
#

# Base definitions
SHELL = /bin/sh
export OUTPUT = OUTPUT
export LTMPDIR = tmp
export XML_CATALOG_FILES = docbook/catalog.xml
DEFAULT_CATALOG = "/etc/xml/catalog"
XSLT = xsltproc
XSLT_FLAGS = --xinclude --nonet
XMLTO = xmlto
XMLTO_FLAGS = --skip-validation
IC_VERSIONS = 4.6.0 4.8.0 5.0.0 5.2.0 cvs-head

VPATH = guides refs howtos
.SILENT:

############## No need to modify below ##############

.PHONY: all guides refs howtos %.man cache refxmls

all: $(LTMPDIR)/refs-autogen $(LTMPDIR)/olinkdbs guides refs howtos
	echo all done

guides: $(OUTPUT)/images $(OUTPUT)/files \
  $(patsubst guides/%.xml,OUTPUT/%.html,$(wildcard guides/*.xml))  \
  $(patsubst guides/%.xml,OUTPUT/%,$(wildcard guides/*.xml))

refs: $(OUTPUT)/images $(OUTPUT)/files
	make $(OUTPUT)/pragmas.html $(OUTPUT)/pragmas $(OUTPUT)/pragmas.man
	make $(OUTPUT)/globvars.html $(OUTPUT)/globvars $(OUTPUT)/globvars.man
	make $(OUTPUT)/usertags.html $(OUTPUT)/usertags $(OUTPUT)/usertags.man
	make $(OUTPUT)/systemtags.html $(OUTPUT)/systemtags $(OUTPUT)/systemtags.man
	make $(OUTPUT)/uitags.html $(OUTPUT)/uitags $(OUTPUT)/uitags.man

howtos: howtos/howtos.xml howtos/*.xml
	make $(OUTPUT)/howtos.html
	make $(OUTPUT)/howtos

guides/glossary.xml:
	bin/glossary-autogen

#
# All documents
#

# Unchunked documents
$(OUTPUT)/%.html: %.xml $(OUTPUT)/xmldocs.css
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam current.docid $*                                 \
	--stringparam target.database.document ../docbook/olinkdb-nc.xml  \
	-o $@ docbook/html-nochunks.xsl $<

# Man pages
$(OUTPUT)/%.man: %.xml
	mkdir -p $(OUTPUT)/man
	$(XMLTO) $(XMLTO_FLAGS)                                        \
	-x docbook/reference.xsl                                       \
	-o $(OUTPUT)/man/                                              \
	man $<

# Chunked documents
$(OUTPUT)/%: %.xml $(OUTPUT)/xmldocs.css
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam current.docid $*                                 \
	--stringparam target.database.document ../docbook/olinkdb-c.xml  \
	-o $@/ docbook/html-chunks.xsl $<
	touch $@


#
# OlinkDBs
#
# OlinkDB information for unchunked parts
#tmp/olinkdbs: $(LTMPDIR) \
#  $(patsubst guides/%.xml,$(LTMPDIR)/%-c.db,$(wildcard guides/*.xml))  \
#  $(patsubst guides/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard guides/*.xml)) \
#  $(patsubst refs/%.xml,$(LTMPDIR)/%-c.db,$(wildcard refs/*.xml))  \
#  $(patsubst refs/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard refs/*.xml))
#	touch tmp/olinkdbs
$(LTMPDIR)/olinkdbs: $(LTMPDIR)
	make $(patsubst guides/%.xml,$(LTMPDIR)/%-c.db,$(wildcard guides/*.xml))
	make $(patsubst guides/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard guides/*.xml))
	make $(patsubst refs/%.xml,$(LTMPDIR)/%-c.db,$(wildcard refs/*.xml))
	make $(patsubst refs/%.xml,$(LTMPDIR)/%-nc.db,$(wildcard refs/*.xml))
	touch $(LTMPDIR)/olinkdbs

$(LTMPDIR)/%-nc.db: %.xml $(LTMPDIR)
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam collect.xref.targets only                        \
	--stringparam targets.filename $@                              \
	docbook/html-nochunks.xsl $<
	tail +2 $@ > $(LTMPDIR)/tail
	mv $(LTMPDIR)/tail $@

# OlinkDB information for chunked parts
$(LTMPDIR)/%-c.db: %.xml $(TMPDIR)
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam collect.xref.targets only                        \
	--stringparam targets.filename $@                              \
	docbook/html-chunks.xsl $<
	tail +2 $@ > $(LTMPDIR)/tail
	mv $(LTMPDIR)/tail $@


#
# Support targets
#

mkreport: $(LTMPDIR)/mkreport $(LTMPDIR)
	./bin/mkreport $(IC_VERSIONS)
	touch $(LTMPDIR)/mkreport

refxmls: $(LTMPDIR)/refs-autogen
$(LTMPDIR)/refs-autogen: $(LTMPDIR) bin/refs-autogen
	./bin/refs-autogen $(IC_VERSIONS)
	touch $(LTMPDIR)/refs-autogen

$(OUTPUT): $(LTMPDIR)
	mkdir -p $(OUTPUT)

$(OUTPUT)/xmldocs.css: docbook/xmldocs.css $(OUTPUT)
	cp docbook/xmldocs.css $(OUTPUT)/xmldocs.css

$(OUTPUT)/images: $(wildcard images/*.jpg images/*.png images/*.gif)
	mkdir -p $(OUTPUT)/images/
	cp $(wildcard images/*.jpg images/*.png images/*.gif) $(OUTPUT)/images/

$(OUTPUT)/files: files/*
	rm -rf $(OUTPUT)/files
	mkdir -p $(OUTPUT)/files/
	cp bin/dbgen $(OUTPUT)/files/
	cd files; for p in *; do                                      \
		if test "$$p" != "CVS"; then                              \
			if test -d "$$p"; then                                \
				cp -a $$p ../$(OUTPUT)/files/;                    \
				tar --exclude=CVS -cf ../$(OUTPUT)/files/$$p.tar $$p;            \
				tar --exclude=CVS -zcf ../$(OUTPUT)/files/$$p.tar.gz $$p;           \
				tar --exclude=CVS -jcf ../$(OUTPUT)/files/$$p.tar.bz2 $$p           \
			; fi                                                  \
		; fi                                                      \
	; done
	rm -rf `find $(OUTPUT)/files/ -name CVS`

$(LTMPDIR):
	mkdir -p $(LTMPDIR)


# STATTREE
cache: $(LTMPDIR)/stattrees
$(LTMPDIR)/stattrees: $(LTMPDIR)
	-for p in $(IC_VERSIONS); do \
	./bin/stattree sources/$$p; \
	ctags -R -x --languages=perl --perl-kinds=cls sources/$$p/ \
	> cache/$$p/.objectlist.perl.txt; \
	ctags -R -x --languages=c --c-kinds=cdf sources/$$p/ \
	> cache/$$p/.objectlist.c.txt; \
	ctags -f cache/$$p/.tags -R --extra=fq --fields=afikKlmnsSz --line-directives sources/$$p \
	; done
	touch $(LTMPDIR)/stattrees


#
# Cleanup
#

clean:
	-rm -rf $(OUTPUT)

distclean: clean
	-rm -rf $(LTMPDIR)
	-rm -rf refs/*.xml
	-for p in $(IC_VERSIONS); do rm cache/$$p/* 2>/dev/null; done


# OLD
#
#
#
## TODO Make target that conveniently checks out all IC releases from CVS
#
