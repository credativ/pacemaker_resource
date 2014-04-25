.PHONY=dist
FILES=ocf/credativ/pgrepmgr ocf/credativ/pgstreamrep ocf/credativ/LVMactivation
RA_RELEASE=0.4.0

dist:
	@echo "Making dist files"
	@for i in ${FILES}; do \
		mkdir -p "$$(basename $$i)-${RA_RELEASE}"; \
		cp $$i "$$(basename $$i)-${RA_RELEASE}"; \
		tar -cjf "$$(basename $$i)-${RA_RELEASE}.tar.bz2" $$(basename $$i)-${RA_RELEASE}; \
	done \

clean:
	rm -f *~
	rm -f *.*~
	rm -rf *.tar.bz2
	@for i in ${FILES}; do \
		rm -rf "$$(basename $$i)"*; \
	done \
