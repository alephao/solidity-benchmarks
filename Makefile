.PHONY: codegen
codegen:
	./codegen.sh

.PHONY: snapshot
snapshot:
ifdef VIA_IR
	forge snapshot --force --optimize --use 0.8.13 --snap via-ir/0-8-13.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.14 --snap via-ir/0-8-14.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.15 --snap via-ir/0-8-15.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.16 --snap via-ir/0-8-16.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.17 --snap via-ir/0-8-17.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.18 --snap via-ir/0-8-18.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.19 --snap via-ir/0-8-19.gas-snapshot --via-ir
	forge snapshot --force --optimize --use 0.8.20 --snap via-ir/0-8-20.gas-snapshot --via-ir
else
	forge snapshot --force --optimize --use 0.8.10 --snap 0-8-10.gas-snapshot
	forge snapshot --force --optimize --use 0.8.11 --snap 0-8-11.gas-snapshot
	forge snapshot --force --optimize --use 0.8.12 --snap 0-8-12.gas-snapshot
	forge snapshot --force --optimize --use 0.8.13 --snap 0-8-13.gas-snapshot
	forge snapshot --force --optimize --use 0.8.14 --snap 0-8-14.gas-snapshot
	forge snapshot --force --optimize --use 0.8.15 --snap 0-8-15.gas-snapshot
	forge snapshot --force --optimize --use 0.8.16 --snap 0-8-16.gas-snapshot
	forge snapshot --force --optimize --use 0.8.17 --snap 0-8-17.gas-snapshot
	forge snapshot --force --optimize --use 0.8.18 --snap 0-8-18.gas-snapshot
	forge snapshot --force --optimize --use 0.8.19 --snap 0-8-19.gas-snapshot
	forge snapshot --force --optimize --use 0.8.20 --snap 0-8-20.gas-snapshot
endif


.PHONY: readme
readme:
ifdef VIA_IR
	python3 scripts/main_via_ir.py
else
	python3 scripts/main.py
endif

.PHONY: json
json:
ifdef VIA_IR
	python3 scripts/gen_json_via_ir.py
else
	python3 scripts/gen_json.py
endif