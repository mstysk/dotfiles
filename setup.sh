# Setup

# Install
#  - rust
#  - delta from cargo
#  - bat   from cargo
#  - exa   from cargo
#  - asdf
#  - zinit
#  - php from asdf
#  - starship from asdf
#  - nodejs from asdf
#  - deno from asdf

## Rust Install
### @see https://www.rust-lang.org/tools/installhttps://www.rust-lang.org/tools/install

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

## delta install
cargo install git-delta

## bad install
cargo install bad

## exa install
cargo install exa

## asdf install
### @see https://asdf-vm.com/guide/getting-started.html#_2-download-asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

## zinit
### @see https://github.com/zdharma-continuum/zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
