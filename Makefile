files = Book.txt $(shell cat Book.txt| grep -v '\#')
sitefiles = $(patsubst %.md,site/%.html,$(files))
email ?= true

prjdir = ~/Dropbox/forging-python

any:
	$(error Please pick a target: sync, preview, status, view, site or publish)

sync:
	rsync \
	    --exclude .hg --exclude README.md --exclude leanpub.key \
	    --exclude *.sw[po] --exclude site \
	    -a . $(prjdir)/manuscript

preview: sync
	sleep 10  # Give dropbox time to sync
	curl -d "api_key=$(shell cat leanpub.key)" \
	    https://leanpub.com/forging-python/preview.json

status:
	curl -s -d "api_key=$(shell cat leanpub.key)" \
	    https://leanpub.com/forging-python/book_status | jq .

view:
	xdg-open $(prjdir)/preview/forging-python-preview.pdf


site/%.html: %.md
	sed 's/I>/>/' $< | kramdown --template site/book.erb > $@

site: $(sitefiles)

publish: sync
	sleep 10  # Give dropbox time to sync
	curl \
	    -d "api_key=$(shell cat leanpub.key)" \
	    -d "publish[email_readers]=$(email)" \
	    https://leanpub.com/forging-python/publish.json

wc:
	cat $(files) | wc

.PHONY: any preview status view site publish wc
