.PHONY: all install clean

all:

install:
	$(MAKE) -C apps install
	$(MAKE) -C obsidian install
	$(MAKE) -C github install

clean:
	$(MAKE) -C apps clean
	$(MAKE) -C obsidian clean
	$(MAKE) -C github clean
