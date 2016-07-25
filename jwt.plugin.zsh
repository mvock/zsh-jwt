function jwt {
    alg="HS256"
    typ="JWT"
    header="{\"alg\":\"$alg\",\"typ\":\"$typ\"}"

    payload="$1"
    key="$2"
    shift 2

    claim=$( echo -n "$header" | base64 ).$( echo -n "$payload" | base64 )

    echo "$claim".$( echo -n "$claim" | openssl sha256 -hmac "$key" -binary | base64 )
}
