PDF=book.pdf
TEX=main.tex
MAIN=$(basename $(notdir $(TEX)))
PDFLATEX=pdflatex
BIBTEX=bibtex
REPORT=report.pdf
SUBMIT_ZIP=COL380_2023CS50334_Scribe.zip
ZIP_SOURCES=Makefile main.tex ppbook.cls chapters/*.tex frontmatter/*.tex backmatter/*.bib styles/*.sty *.png

.PHONY: all clean clean-aux submission

all:
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	@if grep -q '\\citation' $(MAIN).aux; then $(BIBTEX) $(MAIN); fi
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	@cp $(MAIN).pdf $(PDF)

clean-aux:
	@rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg $(MAIN).idx $(MAIN).ilg \
		$(MAIN).ind $(MAIN).lof $(MAIN).log $(MAIN).lot $(MAIN).out \
		$(MAIN).run.xml $(MAIN).synctex.gz $(MAIN).toc $(MAIN).fdb_latexmk \
		$(MAIN).fls $(MAIN).dvi $(MAIN).xdv $(MAIN).nav $(MAIN).snm $(MAIN).vrb \
		texput.log

clean: clean-aux
	@rm -f $(MAIN).pdf $(PDF) $(REPORT) $(SUBMIT_ZIP)

submission:
	@$(MAKE) clean-aux
	@$(MAKE) all
	@cp $(MAIN).pdf $(REPORT)
	@rm -f $(SUBMIT_ZIP)
	@zip -q $(SUBMIT_ZIP) $(ZIP_SOURCES)
	@rm -f $(MAIN).pdf $(PDF)
	@$(MAKE) clean-aux
