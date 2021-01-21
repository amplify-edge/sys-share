# subs

# inouts
FIX_HUGO_TARGET_FSPATH=
FIX_HUGO_SOURCE_FSPATH=

# calculated
FIX_HUGO_BACKUP_FSPATH=$(FIX_HUGO_SOURCE_FSPATH)/backup

fix-print:
	@echo -- FIX --
	@echo FIX_HUGO_TARGET_FSPATH:		$(FIX_HUGO_TARGET_FSPATH)
	@echo FIX_HUGO_SOURCE_FSPATH:		$(FIX_HUGO_SOURCE_FSPATH)
	@echo FIX_HUGO_BACKUP_FSPATH:		$(FIX_HUGO_BACKUP_FSPATH)
	@echo

fix-run:
	# https://github.com/cloudfoundry-incubator/quarks-docs/blob/master/config.toml
	cp $(FIX_HUGO_SOURCE_FSPATH)/config.toml $(FIX_HUGO_TARGET_FSPATH)/config.toml
	
fix-backup:
	# copies all files from the orignal to the fix folder, so we can compare them.
	mkdir -p $(FIX_HUGO_BACKUP_FSPATH)
	cp $(FIX_HUGO_TARGET_FSPATH)/config.toml $(FIX_HUGO_BACKUP_FSPATH)/config.toml
	
fix-restore:
	# copes the backups to the original in case you screw up
	cp $(FIX_HUGO_BACKUP_FSPATH)/config.toml $(FIX_HUGO_TARGET_FSPATH)/config.toml