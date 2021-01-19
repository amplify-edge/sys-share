# doc tools

# Bluge

bluge is the new bleve and looks good because its good old Hugo but with a golang server for search.

It creates an index of the markdown ( or html - not sure yet), so that at runtime, your can search it.

https://github.com/blugelabs/bluge

Facets and many types example: https://github.com/blugelabs/beer-search

## Design Intent / Architecture

We have a modular archi and we want each Module to have docs, just like sys-share and sys has docs.

This will make it much easier to keep docs in snc with code, so that when a dev changes the code he / she also changes the docs.

The Server just needs a route called say "/docs" that serves the html that hugo produces.
It will also run the Search page which has a precomputed bleve index which is can search against.

Each Module can hold a route to its docs, and can export that constant to the Docs Server.
A User inside a module can then press a "Help" icon, and will be shown the docs for that module.

For flutter web, we woudl just open a new tab. Not sure how easy it is to faciliate open tab in flutter web, so that the user does not navigate from their page.
For Desktop and mobile, we will embed a Webview. https://pub.dev/packages/webview_flutter
- Many are using this: https://pub.dev/packages?q=dependency%3Awebview_flutter
	- https://pub.dev/packages/web_browser
		- Looks like a good one that uses Iframes to advantage on Web, and not for Native.
		- Used for https://pub.dev/packages?q=dependency%3Aweb_browser.
		- https://github.com/dint-dev/web_node
			- maybe we can use this to mix flutter and html ( from hugo), and so also use this concept for making the flutter modules composable at runtime...
		


## Examples

Its useful to see how others use it to get ideas...

Search: https://github.com/search?l=Go&o=desc&q=bluge&s=indexed&type=Code

blugelabs/bluge_segment_api


swamp uses bluge and restic
https://github.com/swampapp/swamp/
- Has a gtk GUI, so easy to add a Flutter one.
- RESTIC integration is just what we need
	- looks better than Rclone.
- github.com/muesli/go-app-paths
	- We need to use this too as it give golang the OS paths we need
- github.com/arl/statsviz
	- Gives goalng stats to the app over a browser route. EASY to add.
- github.com/zalando/go-keyring
	- Gives access to key ring on all OS's


---

## Bleve v2

Bleve v2 has also landed and we should look at that too.

github.com/blevesearch/bleve/v2


examples using bleve v2

SEARCH: https://github.com/search?l=Go&q=bleve%2Fv2&type=code

- https://github.com/blevesearch/beer-search

- https://github.com/blevesearch/blevex

---

Ui Mapping is getting v2 also 

https://github.com/blevesearch/bleve-mapping-ui/blob/master/mapping.go

- We should use this so we can test this outs.
- eventually replace with equivalent FLutter one.


---

## zapx

Uses new file format: https://github.com/blevesearch/zapx

examples using zapx

SEARCH: https://github.com/search?l=Go&q=blevesearch%2Fzapx&type=code

- Bleve only calls it from Scorch so its properly wrapped now: https://github.com/blevesearch/bleve/blob/master/index/scorch/segment_plugin.go

- This has a CLI for searching !!!
- 	

