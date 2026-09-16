#!/bin/bash

set -x
set -euo pipefail

# Regenerate the committed lockfile with Cargo 1.84+; CI consumes it with --locked.
# The resolver cannot backtrack every transitive MSRV increase, so keep the
# Rust 1.63-compatible selections below until the MSRV jobs validate replacements.
export CARGO_RESOLVER_INCOMPATIBLE_RUST_VERSIONS=fallback
cargo update
cargo update -p bitcoin --precise "0.32.7"
cargo update -p base58ck --precise "0.1.0"
cargo update -p bitcoin_hashes --precise "0.14.0"
cargo update -p bitcoin-io --precise "0.1.3"
cargo update -p bitcoin-units --precise "0.1.2"
cargo update -p serde --precise "1.0.228"
cargo update -p tempfile --precise "3.8.1"
cargo update -p jobserver --precise "0.1.32"
cargo update -p ctrlc --precise "3.4.6"
cargo update -p libc --precise "0.2.175"
cargo update -p once_cell --precise "1.20.3"
