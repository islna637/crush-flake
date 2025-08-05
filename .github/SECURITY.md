# Security Policy

## Supported Versions

We provide security updates for the latest version of the crush-flake project.

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| < Latest| :x:                |

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security vulnerability, please follow these steps:

### For crush-flake specific issues:

1. **DO NOT** create a public issue
2. Email the maintainer directly at the email listed in the repository
3. Include detailed information about the vulnerability:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### For upstream Crush vulnerabilities:

If you find a vulnerability in the Crush application itself (not the flake packaging), please report it directly to the upstream project:
- Repository: https://github.com/charmbracelet/crush
- Follow their security reporting guidelines

## Security Considerations

### Automated Updates

This flake automatically tracks nightly releases from the upstream Crush repository. While we validate builds and run comprehensive tests, users should be aware that:

- Nightly builds may contain unstable features
- Updates are applied automatically through CI/CD
- All updates go through our test suite before being merged

### Supply Chain Security

We implement several measures to ensure supply chain security:

- **Source Verification**: All sources are verified through Nix's content-addressed storage
- **Vendor Hash Validation**: Go module dependencies are validated through vendor hashes
- **Build Reproducibility**: Nix ensures reproducible builds
- **CI/CD Security**: GitHub Actions run in isolated environments with minimal permissions

### Safe Usage

For maximum security:

1. **Pin Versions**: Consider pinning to specific commits rather than tracking `main`
2. **Review Updates**: Check update PRs before merging in production environments
3. **Test First**: Use in development environments before production deployment
4. **Monitor Logs**: Monitor application logs for unexpected behavior

## Response Timeline

- **Initial Response**: Within 24 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Varies based on severity and complexity

## Security Updates

Security updates will be:
- Applied to the main branch
- Tagged appropriately
- Documented in the changelog
- Announced through GitHub releases

---

**Note**: This security policy covers the packaging and distribution aspects of crush-flake. For security issues with the Crush application itself, please refer to the upstream repository.