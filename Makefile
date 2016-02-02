TARGET=go_spec.epub
INPUT=go_spec.html
CONVERTED=go_spec-converted.html

all: epub

clean:
	rm -f $(TARGET) $(INPUT) $(CONVERTED)

epub: $(CONVERTED)
	ebook-convert $(CONVERTED) $(TARGET) --level1-toc '//h:h2' --level2-toc '//h:h3'

$(CONVERTED): $(INPUT)
	perl conv.pl $(INPUT) > $(CONVERTED)

$(INPUT):
	curl -o $(INPUT) -LO https://golang.org/ref/spec

