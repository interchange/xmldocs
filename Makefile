#
# ICDEVGROUP Documentation Makefile
# http://www.icdevgroup.org
# http://www.icdevgroup.org/cgi-bin/cvsweb/xmldocs
# 
# Davor Ocelic, docelic@icdevgroup.org
#

# Those two need to be adjusted with time
export XMLDOCS_CUR_DEVEL = 5.3.0
IC_VERSIONS = 4.6.0 4.8.0 5.0.0 5.2.0 cvs-head

#############################################################
# Base definitions
SYMBOL_TYPES= pragmas vars tags confs filters
GUIDES      = iccattut programming-style
HOWTOS      = howtos
GLOSSARY    = glossary
ALL_DOCS    = $(GLOSSARY) $(HOWTOS) $(GUIDES) $(SYMBOL_TYPES)
SHELL       = /bin/sh
export O    = OUTPUT
export T    = tmp
export XCF  = docbook/catalog.xml
DC          = "/etc/xml/catalog"

# XSLT processor-specific
PSR         = xsltproc
PSR_FLAGS   = --xinclude

VPATH       = guides refs howtos glossary
.SILENT:
.PHONY: all complete
.PHONY: skel
.PHONY: guides howtos symbols glossary
.PHONY: olinkdbs-nc olinks-nc olinkdbs-c olinks-c
.PHONY: clean clean-cache clean-refs distclean look-clean
.PHONY: up-all cvs-sources srcs cvsrcs cvs cvss all-up cvsup
.PHONY: up-% cvs-% %-up %-cvs
.PHONY: cache caches
.PHONY: refxmls


#############################################################
# Complete build
all: $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin) \
  skel refxmls olinks-nc olinks-c                              \
  glossary howtos guides symbols

guides:   $(foreach doc,$(GUIDES),$O/$(doc).html  )            \
          $(foreach doc,$(GUIDES),$O/$(doc))

howtos:   $(foreach doc,$(HOWTOS),$O/$(doc).html  )            \
          $(foreach doc,$(HOWTOS),$O/$(doc))

symbols:  $(foreach doc,$(SYMBOL_TYPES),$O/$(doc).html  )      \
          $(foreach doc,$(SYMBOL_TYPES),$O/$(doc))

glossary: $(foreach doc,$(GLOSSARY),$O/$(doc).html  )

#############################################################
# Skel
skel: $T $O $O/files $O/images $O/xmldocs.css
$T:
	if test -e $T.temporary; then                                \
		echo "U     $T/"; mv $T.temporary $T;                      \
	else                                                         \
		echo "C     $T/";  mkdir -p $T; fi
$O:
	echo "U     $O/"
	mkdir -p $O
$O/files: $(shell find files) bin/dbgen
	echo "C     $@/"
	rm -rf $@/
	cp -a files $O/
	rm -rf `find $@ -name CVS`
	cp bin/dbgen $O/files/
	cd files; for p in *; do                                     \
	  if test "$$p" != "CVS"; then                               \
	    if test -d "$$p"; then                                   \
	      cp -a $$p ../$O/files/;                                \
	      tar --exclude=CVS -cf ../$O/files/$$p.tar $$p;         \
	      tar --exclude=CVS -zcf ../$O/files/$$p.tar.gz $$p;     \
	      tar --exclude=CVS -jcf ../$O/files/$$p.tar.bz2 $$p     \
	    ; fi                                                     \
	  ; fi                                                       \
	; done
$O/images: $(shell find images)
	echo "C     $@/"
	rm -rf $@/
	cp -a images $O/
	rm -rf `find $@ -name CVS`
$O/xmldocs.css: docbook/xmldocs.css
	echo "C     $@"
	cp $< $@


#############################################################
# OLINK DBs (interlinking between documents)
olinkdbs-nc olinks-nc: $(foreach f,$(ALL_DOCS),$T/$f-nc.db)
$T/%-nc.db: %.xml $T
	$(PSR) $(PSR_FLAGS)                                               \
	  $(PROFILE)                                                      \
	  --stringparam collect.xref.targets only                         \
	  --stringparam targets.filename $@                               \
	  docbook/html-nochunks.xsl $<
	  perl -ni -e'print unless $$.==1 and /^<!DOCTYPE/' $@
olinkdbs-c olinks-c: $(foreach f,$(ALL_DOCS),$T/$f-c.db)
$T/%-c.db: %.xml $T
	$(PSR) $(PSR_FLAGS)                                               \
	  $(PROFILE)                                                      \
	  --stringparam collect.xref.targets only                         \
	  --stringparam targets.filename $@                               \
	  docbook/html-chunks.xsl $<
	  perl -ni -e'print unless $$.==1 and /^<!DOCTYPE/' $@


#############################################################
# STANDARD TARGETS || two-pass processing method
$O/%.html: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autohowtos.ent skel
	echo "C     $@"
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $T/$*-nc.profiled docbook/profile.xsl $<
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $@ docbook/html-nochunks.xsl $T/$*-nc.profiled
$O/%: %.xml skel
	echo "C     $@/"
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $T/$*-c.profiled docbook/profile.xsl $<
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $@/ docbook/html-chunks.xsl $T/$*-c.profiled



### ALPHA SUPPORT FOR PDF
#
#   --stringparam  passivetex.extensions  1
#       --stringparam  rootid  "using" 
#

#$O/%.pdf: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autohowtos.ent skel
#	echo "C     $@"
#	$(PSR) $(PSR_FLAGS)                                                \
#	  $(PROFILE)                                                       \
#	  --stringparam current.docid $*                                   \
#	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
#	  -o $T/$*-nc.profiled docbook/profile.xsl $<
#	$(PSR) $(PSR_FLAGS)                                                \
#	  $(PROFILE)                                                       \
#	  --stringparam current.docid $*                                   \
#	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
#	  --stringparam paper.type A4                                      \
#	  --stringparam page.orientation portrait                          \
#	  --stringparam double.sided 1                                     \
#	  --stringparam chapter.autolabel 0                                \
#	  --stringparam appendix.autolabel 0                               \
#	  --stringparam section.autolabel 0                                \
#	  -o $T/$*.fo docbook/fo.xsl $T/$*-nc.profiled
#	fop.sh  -fo  myfile.fo  -pdf  myfile.pdf



#############################################################
# Cleaning
clean:
	-rm -rf $O
clean-cache:
	-rm -f cache/*/.cache.bin 2>/dev/null
clean-refs:
	-rm -f refs/*.xml
distclean: clean clean-cache
	-rm -rf $T
	-rm -rf {refs,glossary,howtos}/*.xml
	-rm -rf docbook/auto{refs,glossary,howtos}.ent
look-clean:
	-mv $T $T.temporary 2>/dev/null



#############################################################
# sources/ directory management
sources:
	echo "U     $@/"
	mkdir -p $@
sources/%: sources $T
	bin/coup $(subst sources/,,$@)
up-all cvs-sources srcs cvsrcs cvs cvss all-up cvsup: sources $T
	for p in $(IC_VERSIONS); do      \
	  bin/coup -u $$p                \
	; done
up-% cvs-% %-up %-cvs: sources/% $T
	bin/coup -u $(subst sources/,,$<)


#############################################################
# Cache files
cache caches: $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin) $T
cache/%/.cache.bin: sources/% bin/stattree
	echo "C     $@"
	bin/stattree $<


#############################################################
# Reference .xmls
# Silly, rewrite this, I forgot about $*. Or $* wouldn't help? I'm not 
# willing to think about it right now.
refxmls: BOTH = --both
refxmls: bin/refs-autogen glossary/glossary.xml howtos/howtos.xml $(foreach stype,$(SYMBOL_TYPES),refs/$(stype).xml)
	:
$T/%.list: BNAME = $(subst $T/,,$@)
refs/%.xml: BNAME = $(subst refs/,,$@)
$T/%.list: FNAME = $(subst .list,,$(BNAME))
refs/%.xml: FNAME = $(subst .xml,,$(BNAME))
# A little 'overwork' here: we regenerate all .xml files even if just
# one file changes.
$T/%.list refs/%.xml: $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin) $(shell find refs/ -regex '.+[^(\.xml)]$$') bin/refs-autogen
	# PEH, -g is useless since tags migrate between tag groups
	#bin/refs-autogen -g $(FNAME) -o $@ $(BOTH) $(IC_VERSIONS)
	bin/refs-autogen -o $@ $(BOTH) $(TARGET_RELEASE) $(IC_VERSIONS)


#############################################################
# One-shot targets
glossary/glossary.xml docbook/autoglossary.ent: $(shell find glossary/ -regex '.+[^(\.xml)]$$') bin/generic-autogen
	bin/generic-autogen glossary
	make tmp/glossary-nc.db tmp/glossary-c.db
howtos/howtos.xml docbook/autohowtos.ent: $(shell find howtos/ -regex '.+[^(\.xml)]$$') bin/generic-autogen
	bin/generic-autogen howtos
	make tmp/howtos-nc.db tmp/howtos-c.db
docbook/autorefs.ent: refxmls


# Helper target, only used by docelic
colt-preview:
	tar jcf OUTPUT.tar.bz2 OUTPUT
	scp OUTPUT.tar.bz2 colt.projectgamma.com:web/ic/xmldocs/

## Man pages
#$(OUTPUT)/%.man: %.xml
#	mkdir -p $(OUTPUT)/man
#	$(XMLTO) $(XMLTO_FLAGS)                                        \
#	-x docbook/reference.xsl                                       \
#	-o $(OUTPUT)/man/                                              \
#	man $<
##
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
