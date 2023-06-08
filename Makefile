.PHONY: codegen
codegen:
	./codegen.sh

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize --use 0.8.10 --snap 0-8-10.gas-snapshot
	forge snapshot --force --optimize --use 0.8.11 --snap 0-8-11.gas-snapshot
	forge snapshot --force --optimize --use 0.8.12 --snap 0-8-12.gas-snapshot
	forge snapshot --force --optimize --use 0.8.13 --snap 0-8-13.gas-snapshot
	forge snapshot --force --optimize --use 0.8.13 --snap 0-8-13-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.14 --snap 0-8-14.gas-snapshot
	forge snapshot --force --optimize --use 0.8.14 --snap 0-8-14-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.15 --snap 0-8-15.gas-snapshot
	forge snapshot --force --optimize --use 0.8.15 --snap 0-8-15-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.16 --snap 0-8-16.gas-snapshot
	forge snapshot --force --optimize --use 0.8.16 --snap 0-8-16-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.17 --snap 0-8-17.gas-snapshot
	forge snapshot --force --optimize --use 0.8.17 --snap 0-8-17-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.18 --snap 0-8-18.gas-snapshot
	forge snapshot --force --optimize --use 0.8.18 --snap 0-8-18-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.19 --snap 0-8-19.gas-snapshot
	forge snapshot --force --optimize --use 0.8.19 --snap 0-8-19-via-ir.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.20 --snap 0-8-20.gas-snapshot
	forge snapshot --force --optimize --use 0.8.20 --snap 0-8-20-via-ir.gas-snapshot --via-ir

.PHONY: readme
readme:
	python3 scripts/main.py

.PHONY: json
json:
	python3 scripts/gen_json.py