V=1.1.0
PREFIX=/usr/local

all:

clean:
	rm -f w3watch-$(V).tar.gz w3watch-$(V).tar.gz.sig

install:
	install -Dm755 w3watch -t $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/w3watch

dist: clean
	git archive --format=tar --prefix=w3watch-$(V)/ $(V) | gzip -9 > w3watch-$(V).tar.gz
	gpg --detach-sign --use-agent w3watch-$(V).tar.gz

.PHONY: all clean dist install uninstall
