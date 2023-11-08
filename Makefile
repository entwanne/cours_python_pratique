PDF = python_pratique.pdf
ZIP = python_pratique.zip
SRC = $(shell find src -name "*.md" | sort -V)
IMG_ZIP = images.zip
IMG_SRC = $(shell ls img/*.png)

FLAGS = --top-level-division=part --toc --pdf-engine=xelatex

GEN = $(PDF) $(ZIP) $(IMG_ZIP)

$(PDF):	$(SRC)
	pandoc -V lang=fr -V geometry:margin=1in -V colorlinks=true $^ -o $@ $(FLAGS)

$(ZIP): $(SRC)
	./gen_archive.py $@ $^

$(IMG_ZIP): $(IMG_SRC)
	zip $@ $^

all: $(GEN)

clean:
	rm -f $(GEN)

re:	clean $(GEN)

.PHONY:	all clean re
