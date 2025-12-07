.PHONY: help install format lint security scan-secrets check test clean run

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	uv sync --extra dev
	uv run pre-commit install

format: ## Format code with Ruff
	uv run ruff format .

lint: ## Lint code with Ruff
	uv run ruff check .

security: ## Run security checks with Bandit
	uv run bandit -r src/

scan-secrets: ## Scan entire git history for secrets with truffleHog
	uv run trufflehog git file://. --json

check: format lint security ## Run all checks (format, lint, security)

pre-commit: ## Run all pre-commit hooks
	uv run pre-commit run --all-files

run: ## Run the application
	uv run python -m ai_presidentials_2026.main

clean: ## Clean cache and temporary files
	find . -type d -name __pycache__ -exec rm -r {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	rm -rf .ruff_cache .pytest_cache .mypy_cache .bandit-report.json
	rm -rf build dist *.egg-info
