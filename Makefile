.PHONY: codegen
codegen:
	stencil render -t templates/ERC20.template.sol -d test-cases.yml -o src/test/ERC20.t.sol
	stencil render -t templates/ERC721.template.sol -d test-cases.yml -o src/test/ERC721.t.sol
	stencil render -t templates/ERC1155.template.sol -d test-cases.yml -o src/test/ERC1155.t.sol

.PHONY: snapshot
snapshot:
	forge snapshot --force --optimize

.PHONY: readme
readme:
	python3 scripts/main.py