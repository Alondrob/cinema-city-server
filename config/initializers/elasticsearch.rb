# ENV["ELASTICSEARCH_URL"] = "https://elastic:X*TuwZvTYbzD8Hm2taHZ@localhost:9200"
ENV["ELASTICSEARCH_HOST"] = "https://localhost:9200"
Searchkick.client_options = {
    transport_options: {
        ssl: {
            verify: false,
            ca_file: "/etc/ssl/certs/transport.p12"
        }
    }
}