function _lazy_nvm() {
    unfunction _lazy_nvm
    unfunction nvm

    # Node.js
    unfunction corepack
    unfunction node
    unfunction pnpm
    unfunction pnpx
    unfunction yarn

    # npm
    unfunction npm
    unfunction npx

    # ts-node
    unfunction ts-node
    unfunction ts-node-cwd
    unfunction ts-node-esm
    unfunction ts-node-script
    unfunction ts-node-transpile-only
    unfunction ts-script

    # TypeScript
    unfunction tsc
    unfunction tsserver

    # ESLint
    unfunction eslint

    # UglifyJS
    unfunction uglifyjs

    # AUR nvm
    source /usr/share/nvm/init-nvm.sh
}

function nvm() { _lazy_nvm; nvm "$@"; }

# Node.js
function corepack() { _lazy_nvm; corepack "$@"; }
function node() { _lazy_nvm; node "$@"; }
function pnpm() { _lazy_nvm; pnpm "$@"; }
function pnpx() { _lazy_nvm; pnpx "$@"; }
function yarn() { _lazy_nvm; yarn "$@"; }

# npm
function npm() { _lazy_nvm; npm "$@"; }
function npx() { _lazy_nvm; npx "$@"; }

# ts-node
function ts-node() { _lazy_nvm; ts-node "$@"; }
function ts-node-cwd() { _lazy_nvm; ts-node-cwd "$@"; }
function ts-node-esm() { _lazy_nvm; ts-node-esm "$@"; }
function ts-node-script() { _lazy_nvm; ts-node-script "$@"; }
function ts-node-transpile-only() { _lazy_nvm; ts-node-transpile-only "$@"; }
function ts-script() { _lazy_nvm; ts-script "$@"; }

# TypeScript
function tsc() { _lazy_nvm; tsc "$@"; }
function tsserver() { _lazy_nvm; tsserver "$@"; }

# ESLint
function eslint() { _lazy_nvm; eslint "$@"; }

# UglifyJS
function uglifyjs() { _lazy_nvm; uglifyjs "$@"; }
