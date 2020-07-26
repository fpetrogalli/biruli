SOURCE=biruli

.PHONY: all clean

all: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).ly
	lilypond $(SOURCE).ly

clean:
	rm *.pdf *.midi
