storage "raft" {
  path    = "/opt/vault/data"
  node_id = "node-a-ca-central-1"
  retry_join {
    auto_join = "provider=aws region=us-east-1 tag_key=vault tag_value=us-east-1"
  }
}
seal "awskms" {
  region = "ca-central-1"
  kms_key_id = "arn:aws:kms:ca-central-1:926262306356:key/f454fe71-af45-4264-be1d-785d08d84272",
}
listener "tcp" {
 address = "0.0.0.0:8200"
 cluster_address = "0.0.0.0:8201"
 tls_disable = 1
}

api_addr = "https://vault-us-east-1.example.com:8200"
cluster_addr = " https://node-a-us-east-1.example.com:8201"
cluster_name = "vault-prod-us-east-1"
ui = true
log_level = "INFO"