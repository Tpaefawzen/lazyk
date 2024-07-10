DEBUG_FLAG__ = 
DEBUG_FLAG_1_ = -ggdb
DEBUG_FLAG = $(DEBUG_FLAG_$(DEBUG)_)
CFLAGS = -std=c99 -Wall -Werror -Wpedantic -O2 $(DEBUG_FLAG)
PREFIX = /usr/local

all: lazyk

lazyk: lazyk.c
	$(CC) $(CFLAGS) -o $@ $<

test: lazyk
	./run_tests ./lazyk

install: lazyk
	mkdir -p $(PREFIX)/bin
	cp $< $(PREFIX)/bin/

uninstall:
	rm -f $(PREFIX)/bin/lazyk

clean:
	rm -f lazyk

.PHONY: all test install uninstall clean
