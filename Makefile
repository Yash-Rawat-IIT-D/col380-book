PDF=book.pdf
TEX=main.tex
MAIN=$(basename $(TEX))
PDFLATEX=pdflatex
BIBTEX=bibtex

.PHONY: all clean

all:
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	@if grep -q '\\citation' $(MAIN).aux; then $(BIBTEX) $(MAIN); fi
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	@cp $(MAIN).pdf $(PDF)

clean:
	@rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg $(MAIN).idx $(MAIN).ilg \
		$(MAIN).ind $(MAIN).lof $(MAIN).log $(MAIN).lot $(MAIN).out $(MAIN).pdf \
		$(MAIN).run.xml $(MAIN).synctex.gz $(MAIN).toc $(MAIN).fdb_latexmk \
		$(MAIN).fls $(MAIN).dvi $(MAIN).xdv $(MAIN).nav $(MAIN).snm $(MAIN).vrb \
		texput.log $(PDF)
