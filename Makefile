.DEFAULT_GOAL := help

## ── Build ───────────────────────────────────────────────────────────

.PHONY: build
build: ## Build the plugin
	./gradlew build

.PHONY: shadowjar
shadowjar: ## Build fat JAR with dependencies
	./gradlew shadowJar

## ── Development ─────────────────────────────────────────────────────

.PHONY: clean
clean: ## Clean build artifacts
	./gradlew clean

.PHONY: run
run: ## Run Velocity dev server
	./gradlew runVelocity

## ── Code Quality ────────────────────────────────────────────────────

.PHONY: test
test: ## Run tests
	./gradlew test

.PHONY: fmt
fmt: ## Format code and apply license headers
	./gradlew licenseFormat || echo "licenseFormat not available (requires JDK)"

## ── Publishing ──────────────────────────────────────────────────────

.PHONY: publish
publish: ## Publish to Maven repository
	./gradlew publish

## ── Help ────────────────────────────────────────────────────────────

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
