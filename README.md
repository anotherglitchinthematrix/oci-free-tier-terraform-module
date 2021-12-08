# OCI-FREE-TIER-TERRAFORM-MODULE

Personalized compute instance deployment configuration for Oracle Cloud Infrastructure provider.

### Always Free Tier Limitations [(source)](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm#freetier_topic_Always_Free_Resources_Infrastructure)

> **Micro instances (AMD processor)**: All tenancies get two Always Free VM instances using the VM.Standard.E2.1.Micro shape, which has an AMD processor.

> **Ampere A1 Compute instances (Arm processor)**: All tenancies get the first 3,000 OCPU hours and 18,000 GB hours per month for free for VM instances using the VM.Standard.A1.Flex shape, which has an Arm processor. For Always Free tenancies, this is equivalent to 4 OCPUs and 24 GB of memory.

You can also distribute this resources equally into multiple instances by configuring the variables like in the examples below.

```hcl
# One instance
num_instances                       = 1
instance_ocpus                      = 4
instance_shape_config_memory_in_gbs = 24

# Two instances
num_instances                       = 2
instance_ocpus                      = 2
instance_shape_config_memory_in_gbs = 12

# Four instances
num_instances                       = 1
instance_ocpus                      = 1
instance_shape_config_memory_in_gbs = 6
```

## Helper script `out-of-capacity.sh`

Out of capacity is a common error when trying to create an instance in OCI provider using the Always Free tier, this little helper script will try to apply the terraform plan until it succeeds.

### Suggestion

Before trying the `out-of-capacity` helper right away, try gradually upgrading the `instance_ocpus` and `instance_shape_config_memory_in_gbs` starting from the minimum requirements, and run this script only after when you encounter the error "Out of Capacity".

## State Storage Backend

After the successful creation of the desired instance, it would be better to persist the state by migrating to a remote backend such as S3, for this need you can also use Oracle's AWS S3 compatible Bucket Service's versioned Always Free Tier to store the state file, you can follow [the official guideline](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm#s3) to create such a bucket. The template below is using access/secret key authentication rather than the credential file recommended by the documentation.

This is a piece of sensitive information that **should not** be version controlled. Instead of directly writing to `main.tf` file, create and use the override file, `main_override.tf`, to hold this sensitive data.

```hcl
# main_override.tf
terraform {
  backend "s3" {
    bucket                      = "<Bucket>"
    key                         = "<Key/PathOnBucket>"
    region                      = "<Region>"
    endpoint                    = "https://<Namespace>.compat.objectstorage.<Region>.oraclecloud.com"
    access_key                  = "<AccessKey>"
    secret_key                  = "<SecretKey>"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
```

After the change, init once again to reflect the backend change, it should be prompt a dialog to migrate the old state file to S3 backend.

```bash
$ terraform init
$ terraform apply -auto-approve
````

## Allow Inbound Traffic

To allow inbound traffic from anywhere you have to delete an INPUT REJECT rule from the iptables. If you choose to do these steps automatically, a remote-exec step is configured to handle this process if you set `auto_iptables` and `ssh_private_key` variables under the `terraform.tfvars`.

### Automatic execution
```bash
auto_iptables   = true
ssh_private_key = "~/.ssh/id_rsa"
```

### Manual execution
```bash
$ # Backup the current iptables configuration.
$ iptables -L > ~/iptables.bak
$ # Find and delete the line number that contains the "REJECT anywhere anywhere" from the Chain INPUT.
$ iptables -L --line-numbers
$ iptables -D INPUT <LINE_NUMBER>
$ # Preserve the iptables rules.
$ iptables-save > /etc/iptables/rules.v4
```
