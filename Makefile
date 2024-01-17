.PHONY: codegen
codegen:
	./codegen.sh

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize --use 0.8.20 --snap 0-8-20.gas-snapshot
	forge snapshot --force --optimize --use 0.8.20 --snap 0-8-20-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.21 --snap 0-8-21.gas-snapshot
	forge snapshot --force --optimize --use 0.8.21 --snap 0-8-21-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.22 --snap 0-8-22.gas-snapshot
	forge snapshot --force --optimize --use 0.8.22 --snap 0-8-22-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.23 --snap 0-8-23.gas-snapshot
	forge snapshot --force --optimize --use 0.8.23 --snap 0-8-23-via-ir.gas-snapshot --via-ir

.PHONY: readme
readme:
	python scripts/main.py

.PHONY: json
json:
	python scripts/gen_json.py