README.md: README.md.t src/* Makefile
	expand-macros.py $< $@ # requires `macro_expander` (https://github.com/CD3/macro_expander)
