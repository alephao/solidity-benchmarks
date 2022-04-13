.PHONY: codegen
codegen:
	stencil render -t templates/TestTemplate.sol -d test-cases.yml -o src/test/Tests.t.sol