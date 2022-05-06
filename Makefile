.PHONY: codegen
codegen:
	./codegen.sh

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize --use 0.8.10 --snap 0-8-10.gas-snapshot
	forge snapshot --force --optimize --use 0.8.11 --snap 0-8-11.gas-snapshot
	forge snapshot --force --optimize --use 0.8.12 --snap 0-8-12.gas-snapshot
	forge snapshot --force --optimize --use 0.8.13 --snap 0-8-13.gas-snapshot

.PHONY: readme
readme:
	python3 scripts/main.py