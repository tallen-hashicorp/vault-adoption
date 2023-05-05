# Vault Adoption

## Notes


* https://github.com/hashicorp/hashicups-setups/tree/main/docker-compose-deployment
* https://registry.terraform.io/providers/hashicorp/hashicups/latest/docs
* https://github.com/hashicorp/terraform-provider-hashicups
* https://developer.hashicorp.com/terraform/tutorials/providers/provider-setup
* https://www.hashicorp.com/resources/adopting-hashicorp-vault

## Next Steps
- Add policy for DB
- Add policy to group - problem here is when I add the group in one module it's not known by the other module
    Few things I can think of, actualy this is probaly the best, create a new group for DB with all exisiting entities, get from the group or something
- After DB is done look at custom provider, we want to hit an API with eveyone that has access so we can track it in a dashboard

