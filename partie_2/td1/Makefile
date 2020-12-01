
tex_name = rapport
pdf_name=BOUTON_Nicolas_TD-CN-1

.PHONY: pdf clean

all: pdf clean

pdf:
	pdflatex $(tex_name).tex
	mv $(tex_name).pdf $(pdf_name).pdf

clean:
	rm -Rf *~ */*~ *.aux *.log *.toc *.out
