# Contributing to Smart Traffic Monitor

Thank you for your interest in contributing to Smart Traffic Monitor! This document provides guidelines and instructions for contributing.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)

---

## Code of Conduct

This project adheres to a code of conduct that all contributors are expected to follow:

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other contributors

---

## Getting Started

### Prerequisites

- Python 3.8 or higher
- Git
- (Optional) CUDA-compatible GPU for faster processing

### Setup Development Environment

1. **Fork and clone the repository**

```bash
git clone https://github.com/your-username/Smart-Traffic-Monitor.git
cd Smart-Traffic-Monitor
```

2. **Run the setup script**

```bash
chmod +x setup.sh
./setup.sh
```

3. **Activate virtual environment**

```bash
source venv/bin/activate
```

4. **Install development dependencies**

```bash
pip install -r requirements.txt
pip install pytest pytest-cov black flake8 mypy
```

---

## Development Workflow

### Branch Naming Convention

- `feature/description` - New features
- `bugfix/description` - Bug fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring
- `test/description` - Test additions/modifications

Example: `feature/speed-estimation`

### Commit Message Guidelines

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Example:**

```
feat(tracker): add DeepSORT integration

- Implemented DeepSORT wrapper class
- Added track ID persistence across frames
- Configured tracker parameters for optimal performance

Closes #12
```

---

## Coding Standards

### Python Style Guide

We follow [PEP 8](https://pep8.org/) with some modifications:

- **Line length**: 100 characters (not 79)
- **Quotes**: Prefer double quotes for strings
- **Imports**: Organized with `isort`

### Code Formatting

Use `black` for automatic code formatting:

```bash
black src/ tests/
```

### Linting

Run `flake8` to check for style issues:

```bash
flake8 src/ tests/ --max-line-length=100
```

### Type Hints

Use type hints for function signatures:

```python
def process_frame(frame: np.ndarray, threshold: float = 0.5) -> List[Detection]:
    """Process a single frame and return detections."""
    pass
```

Run `mypy` for type checking:

```bash
mypy src/
```

### Documentation

- **Docstrings**: Use Google-style docstrings

```python
def detect_vehicles(frame: np.ndarray) -> List[Dict]:
    """Detect vehicles in a video frame.

    Args:
        frame: Input video frame as numpy array (H, W, C).

    Returns:
        List of detections, each containing bbox, class, and confidence.

    Raises:
        ValueError: If frame dimensions are invalid.
    """
    pass
```

- **Comments**: Use inline comments for complex logic only
- **README updates**: Update README.md when adding features

---

## Testing

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src tests/

# Run specific test file
pytest tests/test_detector.py

# Run with verbose output
pytest -v
```

### Writing Tests

- **Location**: Place tests in `tests/` directory
- **Naming**: Test files should be named `test_*.py`
- **Structure**: Mirror the `src/` structure

**Example:**

```python
# tests/test_detector.py
import pytest
from src.detector import Detector

class TestDetector:
    def test_initialization(self):
        detector = Detector(model_path="yolov8n.pt")
        assert detector.model is not None

    def test_detect_returns_list(self, sample_frame):
        detector = Detector()
        detections = detector.detect(sample_frame)
        assert isinstance(detections, list)
```

### Test Coverage

- Aim for **>80% code coverage**
- All new features must include tests
- Critical paths (detection, tracking) should have **>90% coverage**

---

## Pull Request Process

### Before Submitting

1. **Ensure all tests pass**

```bash
pytest
```

2. **Run linters**

```bash
black src/ tests/
flake8 src/ tests/
mypy src/
```

3. **Update documentation**
   - Update README.md if adding features
   - Add docstrings to new functions/classes
   - Update TASKS.md to mark completed tasks

4. **Update CHANGELOG** (if applicable)

### Submitting a Pull Request

1. **Push your branch**

```bash
git push origin feature/your-feature
```

2. **Create Pull Request on GitHub**
   - Use a descriptive title
   - Reference related issues (e.g., "Closes #42")
   - Provide detailed description of changes
   - Add screenshots/videos for UI changes

3. **PR Template**

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] All tests pass
- [ ] New tests added
- [ ] Manual testing performed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

### Review Process

- PRs require at least one approval
- Address review comments promptly
- Keep PRs focused (one feature/fix per PR)
- Rebase on main if conflicts arise

---

## Reporting Issues

### Bug Reports

Use the bug report template and include:

- **Description**: Clear description of the bug
- **Steps to Reproduce**: Detailed steps
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Environment**: OS, Python version, GPU info
- **Logs**: Relevant error messages/logs
- **Screenshots**: If applicable

### Feature Requests

Use the feature request template and include:

- **Problem**: What problem does this solve?
- **Proposed Solution**: How should it work?
- **Alternatives**: Other approaches considered
- **Additional Context**: Examples, mockups, etc.

---

## Additional Resources

- [Project Roadmap](TASKS.md)
- [Architecture Documentation](docs/architecture.md)
- [User Guide](docs/user_guide.md)

---

## Recognition

Contributors will be recognized in:
- README.md Contributors section
- Release notes
- Project documentation

Thank you for contributing! 🎉
