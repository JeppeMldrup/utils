WD=$(shell pwd)
FILES=$(wildcard */*)
FILENAMES=$(subst /,SLASH,$(FILES))

all: $(FILENAMES)

$(FILENAMES):
	@echo "Creating symlink"
	echo "ln -s ./$@ ~/scripts/$(@F)"
