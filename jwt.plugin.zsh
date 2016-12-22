function jwt {
    local usage="jwt: Create a JSON Web Token

Syntax: jwt <payload> <key>

Payload must be JSON-encoded. Key must be the plaintext encryption key.

Example: jwt '"'{"name":"John Doe","role":"Global Administrator"}'"' \"\$uper-secret\""

    local alg="HS256"
    local typ="JWT"
    local header="{\"alg\":\"$alg\",\"typ\":\"$typ\"}"

    if [[ $# < 2 || -n "${*[(r)--help]}" ]]; then
        echo "$usage"
        return 1
    fi

    local payload="$1"
    local key="$2"
    shift 2

    local claim=$( echo -n "$header" | base64 ).$( echo -n "$payload" | base64 )

    echo "$claim".$( echo -n "$claim" | openssl sha256 -hmac "$key" -binary | base64 )
}
