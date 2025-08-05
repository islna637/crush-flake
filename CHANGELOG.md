# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of the crush-flake project
- Automatic tracking of nightly releases from charmbracelet/crush
- Intelligent vendor hash determination and updating
- Comprehensive test suite with cross-platform validation  
- CI/CD pipeline with automated update PRs
- Development environment with automation scripts
- Cross-platform support (Linux x86_64/aarch64, macOS Intel/Apple Silicon)

### Changed
- N/A (initial release)

### Deprecated
- N/A (initial release)

### Removed
- N/A (initial release)

### Fixed
- N/A (initial release)

### Security
- N/A (initial release)

---

## Release Notes Format

Future releases will follow this format:

### Version [X.Y.Z] - YYYY-MM-DD

#### Added
- New features

#### Changed
- Changes in existing functionality

#### Deprecated
- Soon-to-be removed features

#### Removed
- Now removed features

#### Fixed
- Bug fixes

#### Security
- Vulnerability fixes

---

## Upstream Tracking

This flake tracks the nightly releases of [charmbracelet/crush](https://github.com/charmbracelet/crush).

### Current Status
- **Tracked Version**: Latest nightly from main branch
- **Update Frequency**: Daily automated checks at 2 AM UTC
- **Vendor Hash**: Automatically determined and updated

### Update Process
Updates are applied automatically through our CI/CD pipeline:
1. Daily check for new commits in upstream repository
2. Automatic flake input updates
3. Vendor hash determination and application
4. Comprehensive testing validation
5. Pull request creation for review and merge

### Manual Updates
You can also trigger updates manually:
```bash
nix develop --command update-nightly
```

---

## Contributing to Changelog

When contributing changes, please:
1. Add entries to the [Unreleased] section
2. Use the appropriate category (Added, Changed, etc.)
3. Write clear, user-focused descriptions
4. Include relevant links to issues or PRs
5. Follow the existing format and style

For more details, see [CONTRIBUTING.md](.github/CONTRIBUTING.md).