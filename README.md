# zsh-jwt #
Antigen bundle that gives the zsh a function to compute a JWT

# What is this about? #
Well, [JWT as a standard](https://tools.ietf.org/html/rfc7519) is not very
complex. In fact, it’s so easy that in a normal linux installation, the
calculation is very easily doable. So I thought I’d write a small zsh
function to do it for me.

# Installation #
With antigen, it’s as easy as adding `mvock/zsh-jwt` to your antigen
bundles.

# Usage #
Once installed, there should exist a function in your trusty `zsh` called
`jwt`. It takes two arguments, first the payload (in quotes, if
necessary), then the key. If the programs `base64` and `openssl` are
correctly installed and working as expected, the output is a JSON Web
Token. You can test it on [jwt.io](https://jwt.io/)

# Limits #
* Currently, the hashing algorithm is hard coded and set to SHA256.
