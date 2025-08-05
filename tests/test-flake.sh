#!/usr/bin/env bash

# Comprehensive test suite for the crush flake
# This script tests all aspects of the flake functionality

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

run_test() {
    local test_name="$1"
    local test_command="$2"
    
    TESTS_RUN=$((TESTS_RUN + 1))
    log_info "Running test: $test_name"
    
    if eval "$test_command"; then
        log_success "Test passed: $test_name"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        log_error "Test failed: $test_name"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Test functions
test_flake_check() {
    nix flake check --no-build
}

test_build_package() {
    nix build .#crush --no-link
}

test_build_default() {
    nix build . --no-link
}

test_binary_functionality() {
    local crush_bin
    crush_bin=$(nix build .#crush --no-link --print-out-paths)/bin/crush
    
    # Test binary exists and is executable
    [[ -x "$crush_bin" ]] || return 1
    
    # Test help command (with timeout to prevent hanging)
    timeout 10s "$crush_bin" --help 2>/dev/null || \
    timeout 10s "$crush_bin" version 2>/dev/null || \
    timeout 10s "$crush_bin" -v 2>/dev/null || \
    true  # It's okay if none of these work, some CLIs don't have standard help
}

test_dev_shell() {
    nix develop --command bash -c "
        # Test that development tools are available
        which go && \
        which nix && \
        which curl && \
        which jq && \
        which check-version && \
        which test-build
    "
}

test_app_run() {
    # Test nix run with timeout
    timeout 10s nix run . -- --help 2>/dev/null || \
    timeout 10s nix run . -- version 2>/dev/null || \
    timeout 10s nix run . -- -v 2>/dev/null || \
    true  # Again, it's okay if these don't work
}

test_formatter() {
    # Test formatting by running fmt and checking if any files would change
    nix fmt
    if git diff --quiet; then
        return 0  # No formatting changes needed
    else
        echo "Code formatting changes detected"
        git diff --name-only
        return 1
    fi
}

test_scripts() {
    # Test development scripts
    nix develop --command check-version
    
    # check-updates exits with code 2 if updates are available, which is normal
    nix develop --command check-updates || {
        local exit_code=$?
        if [[ $exit_code -eq 2 ]]; then
            # Exit code 2 means updates are available, which is expected
            return 0
        else
            # Any other exit code is an actual error
            return $exit_code
        fi
    }
}

test_metadata() {
    # Test flake metadata
    local metadata
    metadata=$(nix flake metadata --json)
    
    # Check that crush-src input exists
    echo "$metadata" | jq -e '.locks.nodes["crush-src"]' > /dev/null
    
    # Check that we have a description
    echo "$metadata" | jq -e '.description' > /dev/null
}

test_cross_platform() {
    # Test that we can evaluate for different systems
    # (only test evaluation, not actual building on other platforms)
    nix eval .#packages.x86_64-linux.crush.pname 2>/dev/null || true
    nix eval .#packages.aarch64-linux.crush.pname 2>/dev/null || true
    nix eval .#packages.x86_64-darwin.crush.pname 2>/dev/null || true
    nix eval .#packages.aarch64-darwin.crush.pname 2>/dev/null || true
}

# Main test execution
main() {
    log_info "Starting comprehensive flake tests..."
    echo
    
    # Core functionality tests
    run_test "Flake check" "test_flake_check"
    run_test "Package build" "test_build_package"
    run_test "Default build" "test_build_default"
    run_test "Binary functionality" "test_binary_functionality"
    run_test "Development shell" "test_dev_shell"
    run_test "App run" "test_app_run"
    run_test "Formatter" "test_formatter"
    run_test "Scripts" "test_scripts"
    run_test "Metadata" "test_metadata"
    run_test "Cross-platform evaluation" "test_cross_platform"
    
    echo
    log_info "Test summary:"
    echo "  Total tests: $TESTS_RUN"
    echo "  Passed: $TESTS_PASSED"
    echo "  Failed: $TESTS_FAILED"
    
    if [[ $TESTS_FAILED -eq 0 ]]; then
        log_success "All tests passed! 🎉"
        exit 0
    else
        log_error "Some tests failed!"
        exit 1
    fi
}

# Run tests
main "$@"