system := $(shell uname -o)

NULL :=
TAB := $(NULL)    $(NULL)
define ENDL

endef

.PHONY: all clean
all: $(system)
	$(info [!] Initialized dotfiles in system)

clean: $(system)_clean
	$(info [!] Cleaned up dotfiles)

#Linux Version
GNU/Linux:
	$(info [.] Stowing files)
	@stow .

GNU/Linux_clean:
	$(info [.] Destowing files)
	@stow -D .

#Windows Version
Msys:
	$(info [X] Not Implemented!)

Msys_clean:
	$(info [X] Not Implemented!)
