
ifndef HAXEPATH
HAXEPATH=$(shell which haxe | xargs dirname)
endif

ifndef HASHLINKPATH
HASHLINKPATH=$(shell which hl | xargs dirname)
endif

run.hl: App.hx
	${HAXEPATH}/haxe --hl run.hl --main App.hx --library heaps-dev --library hlsdl
