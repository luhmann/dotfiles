function unsetproxy
    # ePost proxies
    set -e http_proxy
    set -e https_proxy
end
