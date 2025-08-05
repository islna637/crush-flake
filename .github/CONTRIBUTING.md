# Contributing to crush-flake

Thank you for your interest in contributing to crush-flake! This document provides guidelines and information for contributors.

## 🌟 Ways to Contribute

- **Bug Reports**: Report issues with the flake, build process, or automation
- **Feature Requests**: Suggest improvements to the packaging or automation
- **Code Contributions**: Submit pull requests for fixes or enhancements
- **Documentation**: Improve documentation, examples, or guides
- **Testing**: Help test on different platforms or configurations

## 🚀 Getting Started

### Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- Git
- Basic understanding of Nix flakes (helpful but not required)

### Development Setup

```bash
# Clone the repository
git clone https://github.com/conneroisu/crush-flake.git
cd crush-flake

# Enter development environment
nix develop

# Available commands will be shown in the shell hook
```

### Development Workflow

1. **Make Changes**: Edit the relevant files
2. **Test Changes**: Run the comprehensive test suite
   ```bash
   test-comprehensive
   ```
3. **Format Code**: Ensure code is properly formatted
   ```bash
   nix fmt
   ```
4. **Check Quality**: Run flake checks
   ```bash
   nix flake check
   ```

## 📝 Code Style and Standards

### Nix Code

- **Follow TigerStyle Principles**: Prioritize safety, performance, and developer experience
- **Use Alejandra**: All Nix code is formatted with `alejandra`
- **Meaningful Names**: Use descriptive variable and function names
- **Document Complex Logic**: Add comments for non-obvious code

### Shell Scripts

- **Use `set -euo pipefail`**: Enable strict error handling
- **Quote Variables**: Always quote shell variables
- **Provide Feedback**: Use emoji and clear messages for user feedback
- **Error Handling**: Check return codes and provide meaningful error messages

### Documentation

- **Keep Updated**: Update documentation when making changes
- **Use Examples**: Provide concrete usage examples
- **Clear Structure**: Use consistent formatting and structure

## 🧪 Testing

### Test Categories

1. **Flake Structure**: Validates flake syntax and structure
2. **Build Tests**: Ensures the package builds successfully
3. **Functionality Tests**: Tests the resulting binary works correctly
4. **Integration Tests**: Tests the automation and update mechanisms

### Running Tests

```bash
# Full test suite
test-comprehensive

# Individual test components
nix flake check              # Flake structure and basic validation
nix build . --no-link        # Build test
test-build                   # Build with functionality testing
check-updates                # Update mechanism testing
```

### Adding New Tests

When adding features, please include appropriate tests:

1. Add test cases to `tests/test-flake.sh`
2. Update CI workflows if needed
3. Document test requirements in your PR

## 🔄 Update Process

### Understanding the Automation

The flake includes sophisticated automation for tracking upstream changes:

- **Source Tracking**: Monitors charmbracelet/crush repository
- **Vendor Hash Management**: Automatically determines correct Go module hashes
- **Build Validation**: Ensures updates don't break functionality
- **CI/CD Integration**: Automated testing and PR creation

### Modifying Update Logic

When modifying update mechanisms:

1. Test with `check-updates` and `update-nightly`
2. Verify the sed commands work correctly
3. Test edge cases (network failures, hash mismatches, etc.)
4. Update tests to cover new scenarios

## 📋 Pull Request Process

### Before Submitting

- [ ] Code is formatted (`nix fmt`)
- [ ] Tests pass (`test-comprehensive`)
- [ ] Flake check passes (`nix flake check`)
- [ ] Documentation is updated
- [ ] Changes are tested locally

### PR Guidelines

1. **Clear Title**: Use descriptive, concise titles
2. **Detailed Description**: Explain what changes and why
3. **Reference Issues**: Link to related issues if applicable
4. **Test Evidence**: Show that tests pass
5. **Breaking Changes**: Clearly mark and explain breaking changes

### PR Review Process

1. **Automated Checks**: CI/CD will run automatically
2. **Code Review**: Maintainers will review for:
   - Code quality and style
   - Test coverage
   - Documentation completeness
   - Security considerations
3. **Testing**: Manual testing on different platforms if needed
4. **Approval**: At least one maintainer approval required

## 🐛 Bug Reports

### Good Bug Reports Include

- **Clear Description**: What happened vs. what you expected
- **Reproduction Steps**: Detailed steps to reproduce the issue
- **Environment**: OS, Nix version, system architecture
- **Logs**: Relevant error messages or logs
- **Impact**: How this affects your use case

### Bug Report Template

```markdown
**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Run command '...'
2. See error

**Expected behavior**
What you expected to happen.

**Environment:**
- OS: [e.g., NixOS 24.05, Ubuntu 22.04]
- Nix version: [e.g., 2.18.0]
- Architecture: [e.g., x86_64-linux]

**Additional context**
Any other context about the problem.
```

## 💡 Feature Requests

### Good Feature Requests Include

- **Use Case**: Why is this feature needed?
- **Proposed Solution**: How should it work?
- **Alternatives**: What alternatives have you considered?
- **Impact**: Who would benefit from this feature?

## 🎯 Areas for Contribution

### High Priority

- **Cross-Platform Testing**: Testing on different architectures
- **Error Handling**: Improving error messages and recovery
- **Performance**: Optimizing build times and update processes
- **Documentation**: Examples, troubleshooting guides

### Medium Priority

- **Features**: Additional automation or convenience features
- **Monitoring**: Better observability and logging
- **Integration**: Integration with other tools or platforms

### Low Priority

- **Optimizations**: Minor performance improvements
- **Cleanup**: Code refactoring and cleanup
- **Extras**: Nice-to-have features

## 📚 Resources

### Learning Resources

- [Nix Pills](https://nixos.org/guides/nix-pills/) - Learn Nix fundamentals
- [Nix Flakes Guide](https://nixos.wiki/wiki/Flakes) - Understanding flakes
- [TigerStyle](https://tigerstyle.dev) - Development philosophy we follow

### Project Resources

- [Issue Tracker](https://github.com/conneroisu/crush-flake/issues)
- [Discussions](https://github.com/conneroisu/crush-flake/discussions)
- [Upstream Crush](https://github.com/charmbracelet/crush)

## 🤝 Community Guidelines

### Be Respectful

- Use inclusive and welcoming language
- Respect different viewpoints and experiences
- Accept constructive criticism gracefully
- Focus on what's best for the community

### Be Collaborative

- Help others learn and grow
- Share knowledge and resources
- Ask questions when unclear
- Provide helpful feedback

### Be Professional

- Keep discussions technical and on-topic
- Provide evidence for claims
- Acknowledge contributions from others
- Follow through on commitments

## 📞 Getting Help

### Questions and Discussions

- **GitHub Discussions**: General questions and discussions
- **Issues**: Bug reports and feature requests
- **Development Environment**: Use `nix develop` for consistent environment

### Mentoring

New contributors are welcome! Don't hesitate to:
- Ask questions in issues or discussions
- Request help with setup or development
- Propose improvements to this contribution guide

---

**Thank you for contributing to crush-flake!** 🎉

Your contributions help make this project better for everyone in the Nix and Crush communities.