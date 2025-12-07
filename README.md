# AI Presidentials 2026

A Python project for AI Presidentials 2026.

## Features

- **UV**: Fast Python package manager
- **Ruff**: Fast Python linter and formatter (Black-compatible)
- **Bandit**: Security linter for Python
- **Pre-commit**: Git hooks for code quality and security checks
- **Secret Detection**: Automated checks to prevent committing passwords and API keys

## Setup

### Prerequisites

- Python 3.11+
- [UV](https://github.com/astral-sh/uv) installed

### Installation

1. Install dependencies:
```bash
uv sync
```

2. Install pre-commit hooks:
```bash
uv run pre-commit install
```

### Environment Variables

Copy `.env.example` to `.env` and fill in your values:
```bash
cp .env.example .env
```

**Never commit `.env` to version control!**

## Development

### Running the application

```bash
uv run python -m ai_presidentials_2026.main
```

### Code Quality

Using Make (recommended):
```bash
make format    # Format code
make lint      # Lint code
make security  # Security scan
make check     # Run all checks
```

Or directly with UV:
- **Format code**: `uv run ruff format .`
- **Lint code**: `uv run ruff check .`
- **Security scan**: `uv run bandit -r .`

### Pre-commit Hooks

Pre-commit hooks run automatically on `git commit`. They check for:
- Code formatting (Ruff)
- Code linting (Ruff)
- Security issues (Bandit)
- Secret detection (truffleHog with 800+ patterns)
- Common issues (trailing whitespace, large files, etc.)

To run manually:
```bash
uv run pre-commit run --all-files
```

## Project Structure

```
.
├── src/
│   └── ai_presidentials_2026/
│       ├── __init__.py
│       └── main.py
├── .env.example
├── .gitignore
├── .pre-commit-config.yaml
├── Makefile
├── pyproject.toml
└── README.md
```

## Security

This project includes multiple security measures:
- **Bandit**: Scans for common security issues and vulnerabilities
- **truffleHog**: Comprehensive secret detection with 800+ patterns and entropy analysis
- **Pre-commit hooks**: Prevents committing secrets and security issues

Always use environment variables for sensitive data!
