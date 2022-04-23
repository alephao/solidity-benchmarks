.PHONY: codegen
codegen:
	./codegen.sh

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize

.PHONY: readme
readme:
	python3 scripts/main.py