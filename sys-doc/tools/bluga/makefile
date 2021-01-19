# https://github.com/blugelabs/blugelabs.com

LIB_NAME=blugelabs.com
LIB=github.com/blugelabs/$(LIB_NAME)

BIN_DIRECTORY=$(PWD)/_bin
DATA_DIRECTORY=$(PWD)/_data

LIB_HUGO_NAME=hugo
LIB_HUGO_BIN=$(BIN_DIRECTORY)/$(LIB_HUGO_NAME)

LIB_INDEXER_NAME=indexer
LIB_INDEXER_BIN=$(BIN_DIRECTORY)/$(LIB_INDEXER_NAME)

LIB_SEARCH_NAME=searcher
LIB_SEARCH_BIN=$(BIN_DIRECTORY)/$(LIB_SEARCH_NAME)

print:
	@echo 
	@echo LIB: $(LIB)
	@echo 
	@echo BIN_DIRECTORY: 		$(BIN_DIRECTORY)
	@echo DATA_DIRECTORY: 		$(DATA_DIRECTORY)
	@echo 
	@echo LIB_HUGO_NAME: 		$(LIB_HUGO_NAME)
	@echo LIB_HUGO_BIN: 		$(LIB_HUGO_BIN)
	@echo 
	@echo LIB_INDEXER_NAME: 	$(LIB_INDEXER_NAME)
	@echo LIB_INDEXER_BIN: 		$(LIB_INDEXER_BIN)
	@echo 
	@echo LIB_SEARCH_NAME: 		$(LIB_SEARCH_NAME)
	@echo LIB_SEARCH_BIN: 		$(LIB_SEARCH_BIN)
	@echo 

dep:
	git clone https://$(LIB)
dep-delete:
	rm -rf $(LIB_NAME)


### Binaries needed

build-all: build-hugo build-indexer build-search
build-all-delete: build-hugo-delete build-indexer-delete build-search-delete

build-hugo: build-hugo-delete
	git clone https://github.com/gohugoio/hugo.git
	cd hugo && go build -o $(LIB_HUGO_BIN) .
build-hugo-delete:
	rm -rf hugo
	rm -rf $(LIB_HUGO_BIN)

build-indexer: build-indexer-delete
	cd $(LIB_NAME)/bluge_index_dir && go build -o $(LIB_INDEXER_BIN) .
build-indexer-delete:
	rm -rf $(LIB_INDEXER_BIN)

build-search: build-search-delete
	cd $(LIB_NAME)/funcsrc/site-search && go build -o $(LIB_SEARCH_BIN) .
build-search-delete:
	rm -rf $(LIB_SEARCH_BIN)

### Using them...

HUGO_DATA_FSPATH=$(DATA_DIRECTORY)/site
HUGO_DATA_PUBLIC_FSPATH=$(PWD)/$(LIB_NAME)/public
INDEX_DATA_FSPATH=$(DATA_DIRECTORY)/index

data-init:
	# copy hugo site to the data directory so we can blow it away and recreate as needed.
	mkdir -p $(DATA_DIRECTORY)
	cp -r $(PWD)/$(LIB_NAME)  
data-init-delete:
	mkdir -p $(DATA_DIRECTORY)

run:
	# run indexer on the public hugo. Its needs source and destination paths
	$(LIB_INDEXER_BIN) $(HUGO_DATA_PUBLIC_FSPATH) $(INDEX_DATA_FSPATH)


