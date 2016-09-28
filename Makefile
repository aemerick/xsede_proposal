MAIN=main

PERF=code_performance

LATEX=pdflatex

main: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(MAIN) || true
	bibtex $(MAIN)
	$(LATEX) $(MAIN) || true
	bibtex $(MAIN)
	$(LATEX) $(MAIN) || true
	$(LATEX) $(MAIN) || true
	rm -f $(MAIN).blg $(MAIN).log $(MAIN).aux

performance: $(PERF).pdf

$(PERF).pdf: $(PERF).tex
	$(LATEX) $(PERF) || true
	bibtex $(PERF)
	$(LATEX) $(PERF) || true
	bibtex $(PERF)
	$(LATEX) $(PERF) || true
	$(LATEX) $(PERF) || true
	rm -f $(PERF).blg $(PERF).log $(PERF).aux

clean_performance:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *.log *-temp.* *.blg $(PERF).ps $(PERF).bbl $(PERF).pdf

clean_main:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *.log *-temp.* *.blg $(MAIN).ps $(MAIN).bbl $(MAIN).pdf

clean:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *.log *-temp.* *.blg $(MAIN).ps $(PERF).ps $(MAIN).bbl $(PERF).bbl $(MAIN).pdf $(PERF).pdf
