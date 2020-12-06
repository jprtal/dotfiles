function cert-sha1() {
    openssl x509 -inform PEM -pubkey -noout -in $1 | openssl pkey -pubin -outform DER | openssl dgst -sha1 -binary | openssl enc -base64
}

function sound-card-params() {
    cat /proc/asound/card$1/pcm0p/sub0/hw_params
}
