function cert-sha1() {
    openssl x509 -inform PEM -pubkey -noout -in $1 | openssl pkey -pubin -outform DER | openssl dgst -sha1 -binary | openssl enc -base64
}

function sound-card-params() {
    cat /proc/asound/card$1/pcm0p/sub0/hw_params
}

# Deal with "Verification failed for feature 10"
function bns() {
    while ! bn "$1"; do
        :
    done
}

function pip-update() {
    for i in $(pip list -o | awk "NR > 2 {print $1}"); do
        pip install --user -U $i;
    done
}
