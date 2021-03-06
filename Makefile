#
# ICDEVGROUP Documentation Makefile
# http://www.icdevgroup.org
# http://git.icdevgroup.org/?p=xmldocs.git;a=summary
# 
# Davor Ocelic, docelic@icdevgroup.org
#

# Those two need to be adjusted with time
export XMLDOCS_CUR_DEVEL = 5.7.0
IC_VERSIONS = 4.6.0 4.8.0 5.0.0 5.2.0 5.4.0 5.6.0 git-head

#############################################################
# Base definitions
SYMBOL_TYPES= pragmas vars tags confs filters orderchecks widgets
GUIDES      = iccattut programming-style upgrade faq index optimization search xmldocs WHATSNEW install databases howtos wellwell
GLOSSARY    = glossary
ALL_DOCS    = $(GLOSSARY) $(GUIDES) $(SYMBOL_TYPES)
SHELL       = /bin/sh
OUTPUT     ?= -std
TARGET     ?= $(XMLDOCS_CUR_DEVEL)
PROFILE    ?= --stringparam profile.condition standard
PROFILE    += --stringparam profile.revision r$(TARGET)
TARGET_RELEASE = --last $(TARGET)
export O    = OUTPUT$(OUTPUT)
export T    = tmp
export XCF  = docbook/catalog.xml
DC          = "/etc/xml/catalog"

# XSLT processor-specific
PSR         = xsltproc
PSR_FLAGS   = --xinclude --nonet

# Scripts and options
REFS_AUTOGEN = bin/refs-autogen
REFS_AUTOGEN_FLAGS ?=

VPATH       = guides refs glossary whatsnew
.SILENT:
.PHONY: all complete
.PHONY: skel
.PHONY: guides symbols glossary
#.PHONY: olinkdbs-nc olinks-nc olinkdbs-c olinks-c
.PHONY: clean clean-cache clean-refs distclean look-clean
.PHONY: up-all git-sources srcs gitrcs git gits all-up gitup
.PHONY: up-% git-% %-up %-git
.PHONY: cache caches
.PHONY: refxmls
.PHONY: $O

#############################################################
# Complete build
all: skel cache refxmls                                            \
     olinkdbs-nc olinkdbs-c                                        \
		 glossary symbols guides

chunked:  skel cache refxmls olinkdbs-nc olinkdbs-c                \
          $(foreach doc,$(ALL_DOCS),OUTPUT/$(doc))

nonchunked:  skel cache refxmls olinkdbs-nc olinkdbs-c             \
          $(foreach doc,$(ALL_DOCS),OUTPUT/$(doc).html )

guides:   $(foreach doc,$(GUIDES),OUTPUT/$(doc).html  )            \
          $(foreach doc,$(GUIDES),OUTPUT/$(doc))

symbols:  $(foreach doc,$(SYMBOL_TYPES),OUTPUT/$(doc).html  )      \
          $(foreach doc,$(SYMBOL_TYPES),OUTPUT/$(doc))

glossary: $(foreach doc,$(GLOSSARY),OUTPUT/$(doc).html  )          \
          $(foreach doc,$(GLOSSARY),OUTPUT/$(doc))

#############################################################
# Skel
skel:
	make $T
	make $O
	make OUTPUT/files OUTPUT/images OUTPUT/xmldocs.css

$T:
	if test -e $T.temporary; then                                \
		echo "U     $T/"; mv $T.temporary $T;                      \
	else                                                         \
		echo "C     $T/";  mkdir -p $T; fi
$O:
	echo "U     $O/"
	mkdir -p $O
	echo "S     OUTPUT -> $O/"
	rm -f OUTPUT
	ln -s $O OUTPUT
OUTPUT/files: $(shell find files) bin/dbgen
	echo "C     $@/"
	rm -rf $@/
	cp -Rp files $O/
	rm -rf `find $@ -name CVS`
	rm -rf `find $@ -name .git`
	cp bin/dbgen $O/files/
	cd files; for p in *; do                                     \
	  if test "$$p" != "CVS"; then                               \
			if test "$$p" != ".git"; then                               \
				if test -d "$$p"; then                                   \
					cp -Rp $$p ../$O/files/;                                \
					tar --exclude=CVS --exclude=.git -cf ../$O/files/$$p.tar $$p;         \
					tar --exclude=CVS --exclude=.git -zcf ../$O/files/$$p.tar.gz $$p;     \
					tar --exclude=CVS --exclude=.git -jcf ../$O/files/$$p.tar.bz2 $$p     \
				; fi                                                     \
			; fi                                                       \
	  ; fi                                                       \
	; done
OUTPUT/images: $(shell find images)
	echo "C     $@/"
	rm -rf $@/
	cp -Rp images $O/
	rm -rf `find $@ -name CVS`
	rm -rf `find $@ -name .git`
OUTPUT/xmldocs.css: docbook/xmldocs.css
	echo "C     $@"
	cp $< $@


#############################################################
# OLINK DBs (interlinking between documents)
olinkdbs-nc olinks-nc: $(foreach f,$(ALL_DOCS),$T/$f-nc.db)
$T/%-nc.db: %.xml
	$(PSR) $(PSR_FLAGS)                                               \
	  $(PROFILE)                                                      \
	  --stringparam collect.xref.targets only                         \
	  --stringparam targets.filename $@                               \
	  docbook/html-nochunks.xsl $<
	  perl -ni -e'print unless $$.==1 and /^<!DOCTYPE/' $@
olinkdbs-c olinks-c: $(foreach f,$(ALL_DOCS),$T/$f-c.db)
$T/%-c.db: %.xml
	$(PSR) $(PSR_FLAGS)                                               \
	  $(PROFILE)                                                      \
	  --stringparam collect.xref.targets only                         \
	  --stringparam targets.filename $@                               \
	  docbook/html-chunks.xsl $<
	  perl -ni -e'print unless $$.==1 and /^<!DOCTYPE/' $@


#############################################################
# STANDARD TARGETS || two-pass processing method
#OUTPUT/howtos.html: DEPTH = "--stringparam toc.max.depth 1"
OUTPUT/%.html: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autofiles.ent
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
OUTPUT/%: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autofiles.ent
	echo "C     $@/"
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-c.xml \
	  -o $T/$*-c.profiled docbook/profile.xsl $<
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-c.xml \
	  -o $@/ docbook/html-chunks.xsl $T/$*-c.profiled
OUTPUT/%.man: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autofiles.ent docbook/reference.xsl
	echo "C     $@/"
	mkdir -p "$@"
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $T/$*-c.profiled docbook/profile.xsl $<
	$(PSR) $(PSR_FLAGS)                                                \
	  $(PROFILE)                                                       \
	  --stringparam current.docid $*                                   \
	  --stringparam target.database.document ../docbook/olinkdb-nc.xml \
	  -o $@/ docbook/reference.xsl $T/$*-c.profiled
#OUTPUT/%.pdf: tmp/%.latex
#	echo "C     $@"
#	pdflatex $<




#############################################################
# Supporting target - LATEX output
#tmp/%.latex: %.xml docbook/autorefs.ent docbook/autoglossary.ent docbook/autofiles.ent
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
#	  -o $T/$*.latex docbook/latex.xsl $T/$*-nc.profiled


#############################################################
# Cleaning
clean:
	-rm -rf $O OUTPUT
clean-cache:
	-rm -f cache/*/.cache.bin 2>/dev/null
clean-refs:
	-rm -f refs/*.xml
distclean: clean clean-cache
	-rm -rf $T
	-rm -rf {refs,glossary}/*.xml
	-rm -rf docbook/auto{refs,glossary,files}.ent
look-clean:
	-mv $T $T.temporary 2>/dev/null
commit:
	make look-clean
	git commit



#############################################################
# sources/ directory management
sources:
	echo "U     $@/"
	mkdir -p $@
sources/%: sources $T
	bin/coup $(subst sources/,,$@)
up-all git-sources srcs gitrcs git gits all-up gitup: sources $T
	for p in $(IC_VERSIONS); do      \
	  bin/coup -u $$p                \
	; done
up-% git-% %-up %-git: sources/% $T
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
refxmls: $(REFS_AUTOGEN) $(foreach stype,$(SYMBOL_TYPES),refs/$(stype).xml) glossary/glossary.xml
	:
$T/%.list: BNAME = $(subst $T/,,$@)
refs/%.xml: BNAME = $(subst refs/,,$@)
$T/%.list: FNAME = $(subst .list,,$(BNAME))
refs/%.xml: FNAME = $(subst .xml,,$(BNAME))
# A little 'overwork' here: we regenerate all .xml files even if just
# one file changes.
$T/%.list refs/%.xml: $(foreach icver,$(IC_VERSIONS),cache/$(icver)/.cache.bin) $(shell find refs/ -regex '.+[^(\.xml)]$$') $(REFS_AUTOGEN)
	# PEH, -g is useless since tags migrate between tag groups
	#$(REFS_AUTOGEN) $(REFS_AUTOGEN_FLAGS) -g $(FNAME) -o $@ $(BOTH) $(IC_VERSIONS)
	$(REFS_AUTOGEN) $(REFS_AUTOGEN_FLAGS) -o $@ $(BOTH) $(TARGET_RELEASE) $(IC_VERSIONS)


#############################################################
# One-shot targets
glossary/glossary.xml docbook/autoglossary.ent: $(shell find glossary/ -regex '.+[^(\.xml)]$$') bin/generic-autogen
	bin/generic-autogen glossary
docbook/autorefs.ent: refxmls
docbook/autofiles.ent: refxmls


#############################################################
# Infobot IRC bot factoids
files/infobot/interchange.fact facts: refxmls bin/infobot.facts
	bin/infobot.facts

#############################################################
# IC source tree stats
guides/stats.xml: guides/stats-template.xml
	bin/mkreport

## Helper target, only used by docelic
#colt-preview:
#	tar jcf OUTPUT.tar.bz2 OUTPUT
#	scp OUTPUT.tar.bz2 colt.projectgamma.com:web/ic/xmldocs/
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
