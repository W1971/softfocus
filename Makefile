.PHONY: governance governance-low governance-fail governance-release

governance:
	./scripts/governance/full-governance-run.sh base

governance-low:
	./scripts/governance/full-governance-run.sh low yes

governance-fail:
	./scripts/governance/full-governance-run.sh fail

governance-release:
	@if [ -z "$(TAG)" ]; then \
		echo "Usage: make governance-release TAG=vX.Y.Z"; \
		exit 1; \
	fi
	./scripts/governance/full-governance-run.sh base release $(TAG)
