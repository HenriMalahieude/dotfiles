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
	$(info [.]$(TAB)Stowing files)
	@stow .

GNU/Linux_clean:
	$(info [.]$(TAB)Destowing files)
	@stow -D .

#Windows Version
Msys:
	@cp -r ./.config/nvim/ ~/AppData/Local/
	$(info [.]$(TAB)Copying files)

Msys_clean:
	@rm -rf ~/AppData/Local/nvim
	$(info [.]$(TAB)Deleting files)
