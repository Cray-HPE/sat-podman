all: \
	sat-podman.8 \
	sat-man.8

%.8: %.8.rst
	rst2man $< $@

clean:
	rm -f *.8

.PHONY: all clean
