# Generate solidity files using the gyb templates in ./templates and the data in test-cases.yml
.PHONY: codegen
codegen:
	./codegen.sh

# Build and run tests, output the results to the ./gas-snapshots dir
.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize --use 0.8.20 --snap gas-snapshots/0-8-20
	forge snapshot --force --optimize --use 0.8.20 --snap gas-snapshots/0-8-20-via-ir --via-ir
	forge snapshot --force --optimize --use 0.8.21 --snap gas-snapshots/0-8-21
	forge snapshot --force --optimize --use 0.8.21 --snap gas-snapshots/0-8-21-via-ir --via-ir
	forge snapshot --force --optimize --use 0.8.22 --snap gas-snapshots/0-8-22
	forge snapshot --force --optimize --use 0.8.22 --snap gas-snapshots/0-8-22-via-ir --via-ir
	forge snapshot --force --optimize --use 0.8.23 --snap gas-snapshots/0-8-23
	forge snapshot --force --optimize --use 0.8.23 --snap gas-snapshots/0-8-23-via-ir --via-ir
	forge snapshot --force --optimize --use 0.8.24 --snap gas-snapshots/0-8-24
	forge snapshot --force --optimize --use 0.8.24 --snap gas-snapshots/0-8-24-via-ir --via-ir

# Generate a structured json from gas-snapshots and outputs to ./data.json
.PHONY: json
json:
	python scripts/gen_json.py

# Generate readme files in benchmarks/
.PHONY: readme
readme:
	python scripts/main.py

# run swift generator
.PHONY: readme-swift
readme-swift:
	swift run --package-path generator solbench erc20 data.json benchmarks

# build swift generator docker image
.PHONY: build-generator-docker
build-solbench:
	docker build . -t solbench

# run solbench image
.PHONY: run-generator-docker
	docker run -v ./data.json:/data.json -v ./benchmarks:/benchmarks solbench erc20 /data.json /benchmarks
