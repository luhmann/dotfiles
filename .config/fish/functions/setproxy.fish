function setproxy
set -xU http_proxy http://proxy.inf.epost-dev.de:8080
set -xU https_proxy https://proxy.inf.epost-dev.de:8080
# set -xU no_proxy *.local, 169.254/16, localhost, *.epost-dev.de, *.clear-mail.de, 10.172.*, 127.0.0.1, 192.168.* 
end
