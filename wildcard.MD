# Wildcard SSL

    sudo certbot certonly --manual --preferred-challenges=dns --email user@doman.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d host.domain.com -d *.host.domain.com