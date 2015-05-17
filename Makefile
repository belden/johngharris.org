BASH:=/bin/bash
CP:=/bin/cp
CURL:=/usr/bin/curl
DIFF:=/usr/bin/diff
ECHO:=/bin/echo
TRUE:=/bin/true

INDEX_DOT_HTML:=public_html/index.html
PRODUCTION:=http://johngharris.org

noop:

deploy:
	$(CP) -f $(INDEX_DOT_HTML) /run/user/1000/gvfs/dav:host=cpanel5.easyweb.com,port=2078,ssl=true/public_html/

diff:
	@$(BASH) -c -- '$(DIFF) -u $(INDEX_DOT_HTML) <($(CURL) -s $(PRODUCTION))' && $(ECHO) "No difference between local $(INDEX_DOT_HTML) and deployed." || $(TRUE)
