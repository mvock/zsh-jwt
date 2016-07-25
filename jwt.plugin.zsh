usage="jwt: Create a JSON Web Token

Syntax: jwt <payload> <key>

Payload must be JSON-encoded. Key must be the plaintext encryption key.

Example: jwt '"'{"name":"John Doe","role":"Global Administrator"}'"' \"\$uper-secret\""

function jwt {
    alg="HS256"
    typ="JWT"
    header="{\"alg\":\"$alg\",\"typ\":\"$typ\"}"

    if [[ $# < 2 || -n "${*[(r)--help]}" ]]; then
        echo "$usage"
        return 1
    fi

    payload="$1"
    key="$2"
    shift 2

    claim=$( echo -n "$header" | base64 ).$( echo -n "$payload" | base64 )

    echo "$claim".$( echo -n "$claim" | openssl sha256 -hmac "$key" -binary | base64 )
}
