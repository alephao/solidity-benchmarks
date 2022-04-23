.PHONY: codegen
codegen:
	./codegen.sh
	stencil render -t templates/ERC1155.template.sol -d test-cases.yml -o src/test/ERC1155.t.sol

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize

.PHONY: readme
readme:
	python3 scripts/main.py