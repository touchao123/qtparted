XSLTPROC=xsltproc --novalid
FILENAME=--stringparam filename
LANG=--stringparam lang

all: en fr

files=index.__.html download.__.html screenshots.__.html changes.__.html faq.__.html features.__.html links.__.html

filesfr=$(subst __,fr,$(files))
filesen=$(subst __,en,$(files))

fr: $(filesfr)
en: $(filesen)

%.xml: %.db.xml xml2xml.xsl
	$(XSLTPROC) xml2xml.xsl $< > $@

%.fr.html: %.xml main.xsl
	$(XSLTPROC) $(LANG) fr $(FILENAME) $(basename $(basename $@)) main.xsl \
	$< | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | sed 's/&quot;/'\''/g' \
	| sed 's/%0A%09%20%20%20%20%20%20%20%20//g' | sed 's/net%0A%09%09/net/g' \
	| sed 's/.org%0A%09%09/.org/g' > $@
%.en.html: %.xml main.xsl
	$(XSLTPROC) $(LANG) en $(FILENAME) $(basename $(basename $@)) main.xsl \
	$< | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | sed 's/&quot;/'\''/g' \
	| sed 's/%0A%09%20%20%20%20%20%20%20%20//g' | sed 's/net%0A%09%09/net/g' \
	| sed 's/.org%0A%09%09/.org/g' > $@
clean:
	rm -f index.html
	rm -f news.xml changes.xml future.xml bugs.xml
	rm -f $(filesfr) $(filesen)

upload-fdupoux:
	rm -f index.html
	cp index.en.html index.html
	scp *.html fdupoux@shell.sourceforge.net:/home/groups/q/qt/qtparted/htdocs/

uploadimg-fdupoux:
	scp images/*.png fdupoux@shell.sourceforge.net:/home/groups/q/qt/qtparted/htdocs/images/


