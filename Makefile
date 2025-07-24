.PHONY: all install clean

all:

install:
	$(MAKE) -C apps install
	$(MAKE) -C obsidian install

clean:
	$(MAKE) -C apps clean
	$(MAKE) -C obsidian clean
