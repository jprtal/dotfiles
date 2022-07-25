function _lazy_nvm() {
    unfunction _lazy_nvm
    unfunction nvm
    unfunction node
    unfunction npm
    unfunction npx
    # TypeScript
    unfunction ts-node
    unfunction ts-node-transpile-only
    unfunction ts-node-cwd
    unfunction ts-node-esm
    unfunction tsc

    # AUR nvm
    source /usr/share/nvm/init-nvm.sh
}

function nvm() { _lazy_nvm; nvm "$@"; }
function npm() { _lazy_nvm; npm "$@"; }
function node() { _lazy_nvm; node "$@"; }
function npx() { _lazy_nvm; npx "$@"; }
# TypeScript
function ts-node() { _lazy_nvm; ts-node "$@"; }
function ts-node-transpile-only() { _lazy_nvm; ts-node-transpile-only "$@"; }
function ts-node-cwd() { _lazy_nvm; ts-node-cwd "$@"; }
function ts-node-esm() { _lazy_nvm; ts-node-esm "$@"; }
function tsc() { _lazy_nvm; tsc "$@"; }
