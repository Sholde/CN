NAME = BOUTON_NICOLAS

all: pdf clean

pdf:
	pdflatex rapport.tex

archive:
	cd ..
	cp -r tp/ $(NAME)
	tar -cvf $(NAME).tar $(NAME)/
	gzip $(NAME).tar
	rm -rf $(NAME)/
	cd tp

clean:
	rm -Rf *~ src/*~ *.aux *.log
