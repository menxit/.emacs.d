install:
	npm i -g typescript tslint
	brew install pandoc
	mv .emacs.d .emacs.d_old
	git clone git@github.com:menxit/.emacs.d.git
