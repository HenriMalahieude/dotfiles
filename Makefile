NULL :=
TAB := $(NULL)    $(NULL)
define ENDL

endef

.PHONY: all clean
all:
	stow .

clean:
	stow -D .
