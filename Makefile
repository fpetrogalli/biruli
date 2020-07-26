SOURCE=biruli

.PHONY: all clean

all: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).ly by-sa.eps
	lilypond -dno-point-and-click $(SOURCE).ly

by-sa.eps:
	wget https://mirrors.creativecommons.org/presskit/buttons/88x31/eps/by-sa.eps

clean:
	rm *.pdf *.midi *.eps
