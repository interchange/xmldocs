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

VPATH = guides refs
.SILENT:

############## No need to modify below ##############

.PHONY: all guides refs %.man

all: guides refs
	echo 'all' done

guides: $(OUTPUT)/images $(OUTPUT)/files \
  $(patsubst guides/%.xml,OUTPUT/%.html,$(wildcard guides/*.xml))  \
  $(patsubst guides/%.xml,OUTPUT/%,$(wildcard guides/*.xml))

refs: tmp/refs-autogen $(OUTPUT)/images $(OUTPUT)/files
	make $(OUTPUT)/pragmas.html $(OUTPUT)/pragmas $(OUTPUT)/pragmas.man
	make $(OUTPUT)/globvars.html $(OUTPUT)/globvars $(OUTPUT)/globvars.man


#
# All documents
#

# Unchunked documents
$(OUTPUT)/%.html: %.xml $(OUTPUT)/xmldocs.css
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam current.docid $*                                 \
	--stringparam target.database.document ../docbook/olinkdb.xml  \
	-o $@ docbook/html-nochunks.xsl $<

# Man pages
$(OUTPUT)/%.man: %.xml
	mkdir -p $(OUTPUT)/man
	XML_CATALOG_FILES="$(DEFAULT_CATALOG)" $(XMLTO) $(XMLTO_FLAGS)    \
	-o $(OUTPUT)/man/                                              \
	man $<

# Chunked documents
$(OUTPUT)/%: %.xml $(OUTPUT)/xmldocs.css
	$(XSLT) $(XSLT_FLAGS)                                          \
	--stringparam current.docid $*                                 \
	--stringparam target.database.document ../docbook/olinkdb.xml  \
	-o $@/ docbook/html-chunks.xsl $<
	touch $@

#
# Support targets
#

tmp/mkreport: $(LTMPDIR)
	./bin/mkreport $(IC_VERSIONS)
	touch $@

tmp/refs-autogen: $(LTMPDIR) bin/refs-autogen
	./bin/refs-autogen $(IC_VERSIONS)
	touch $@

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
				tar cf ../$(OUTPUT)/files/$$p.tar $$p;            \
				tar zcf ../$(OUTPUT)/files/$$p.tgz $$p;           \
				tar jcf ../$(OUTPUT)/files/$$p.tbz2 $$p           \
			; fi                                                  \
		; fi                                                      \
	; done
	rm -rf `find $(OUTPUT)/files/ -name CVS`

$(LTMPDIR):
	mkdir -p $(LTMPDIR)


# STATTREE
tmp/stattrees:
	-for p in $(IC_VERSIONS); do \
	./bin/stattree sources/$$p \
	; done

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
# OlinkDBs
#
# TODO OlinkDB targets get properly called implicitly by 
# the above targets, but SOMEHOW the tmp/*.db files are not created.
# Everything works fine if you run it manually. I really don't know
# the problem here.
# OlinkDB information for unchunked parts
#$(LTMPDIR)/%-nc.db: %.xml $(LTMPDIR)
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam collect.xref.targets only                        \
#	--stringparam targets.filename $@                              \
#	docbook/html-nochunks.xsl $<
#
## OlinkDB information for chunked parts
#$(TMPDIR)/%-c.db: %.xml $(TMPDIR)
#	$(XSLT) $(XSLT_FLAGS)                                          \
#	--stringparam collect.xref.targets only                        \
#	--stringparam targets.filename $@                              \
#	docbook/html-chunks.xsl $<
#
#
#	# Generate human-readable ctags information
#	-for p in $(IC_VERSIONS); do \
#		ctags -R -x --languages=perl --perl-kinds=cls sources/$$p/ \
#		> $(CACHE)/$$p/.objectlist.perl.txt; \
#		ctags -R -x --languages=c --c-kinds=cdf sources/$$p/ \
#		> $(CACHE)/$$p/.objectlist.c.txt; \
#		cd sources \
#	; done
#
#tags:
#	# Generate ctags information
#	-for p in $(IC_VERSIONS); do \
#		ctags -f $(CACHE)/$$p/.tags -R --extra=fq --fields=afikKlmnsSz --line-directives sources/$$p; \
#		cd sources \
#	; done
#
## TODO Make target that conveniently checks out all IC releases from CVS
#
