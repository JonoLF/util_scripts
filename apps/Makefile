PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
SCRIPTS = $(wildcard *.sh)

.PHONY: install uninstall

install:
	@echo "Installing symlinks to $(BINDIR)/"
	@for script in $(SCRIPTS); do \
		chmod +x $$script; \
		ln -sf $(CURDIR)/$$script $(BINDIR)/$$(basename $$script .sh); \
		echo "  - $$script → $(BINDIR)/$$(basename $$script .sh)"; \
	done

uninstall:
	@echo "Removing symlinks from $(BINDIR)/"
	@for script in $(SCRIPTS); do \
		rm -f $(BINDIR)/$$(basename $$script .sh); \
		echo "  - Removed $(BINDIR)/$$(basename $$script .sh)"; \
	done
