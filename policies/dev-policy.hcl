path "kv-demo/*"
{
  capabilities = ["read"]
}
path "kv-demo/dev/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
} 
path "kv-demo/prod/*"
{
  capabilities = ["list"]
}