variable "fingerprint" {
  description = "Fingerprint of oci api private key"
  type        = string
}

variable "private_key_path" {
  description = "Path to oci api private key used"
  type        = string
}

variable "region" {
  description = "The oci region where resources will be created"
  type        = string
}

variable "tenancy_ocid" {
  description = "Tenancy ocid where to create the sources"
  type        = string
}

variable "user_ocid" {
  description = "Ocid of user that terraform will use to create the resources"
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment ocid where to create all resources"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance."
  type        = string
}

variable "instance_ad_number" {
  default     = 1
  description = "The availability domain number of the instance. If none is provided, it will start with AD-1 and continue in round-robin."
  type        = number
}

variable "instance_count" {
  default     = 1
  description = "Number of identical instances to launch from a single module."
  type        = number
}

variable "instance_state" {
  default     = "RUNNING"
  description = "(Updatable) The target state for the instance. Could be set to RUNNING or STOPPED."
  type        = string

  validation {
    condition     = contains(["RUNNING", "STOPPED"], var.instance_state)
    error_message = "Accepted values are RUNNING or STOPPED."
  }
}

variable "ssh_public_keys" {
  default     = null
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance. To provide multiple keys, see docs/instance_ssh_keys.adoc."
  type        = string
}

variable "ssh_private_key" {
  default     = null
  description = "Private SSH key for remote execution."
  type        = string
}

variable "auto_iptables" {
  default     = false
  description = "Automatically configure iptables to allow inbound traffic."
  type        = bool
}

variable "assign_public_ip" {
  default     = false
  description = "Whether the VNIC should be assigned a public IP address."
  type        = bool
}

variable "public_ip" {
  default     = "NONE"
  description = "Whether to create a Public IP to attach to primary vnic and which lifetime. Valid values are NONE, RESERVED or EPHEMERAL."
  type        = string
}

variable "num_instances" {
  default = "1"
}

variable "availability_domain" {
  default     = 3
  description = "Availability Domain of the instance"
  type        = number
}

variable "instance_shape" {
  default     = "VM.Standard.A1.Flex"
  description = "The shape of an instance."
  type        = string
}

variable "instance_ocpus" {
  default     = 1
  description = "Number of OCPUs"
  type        = number
}

variable "instance_shape_config_memory_in_gbs" {
  default     = 6
  description = "Amount of Memory (GB)"
  type        = number
}

variable "instance_source_type" {
  default     = "image"
  description = "The source type for the instance."
  type        = string
}

variable "instance_image_ocid" {
  type = map(string)

  # See https://docs.us-phoenix-1.oraclecloud.com/images/
  default = {
    ap-chuncheon-1 = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaapwxk2b27mboilwxhpmz7way3ieph2en6fuzn7umvud5w2c73avdq"
    ap-hyderabad-1 = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaappkh6rl7atdunwb2ivq7u3lmich7emxagfv7nvllra2zzyudfvca"
    ap-melbourne-1 = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaahx2ad72c4amx7rc33kyaqgggjrvgdpwnlyjjuizjk7tveujh7mhq"
    ap-mumbai-1    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaaukej3lmq5ggzxgjvwm6diqa5pkmvpfunvbpetp52urr2euoscsia"
    ap-osaka-1     = "ocid1.image.oc1.ap-osaka-1.aaaaaaaanppegcqrzncgp4a55jq5iwwnabawprxh67iq33vz4t2a2bsx7rza"
    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaax7ckom2im4twkqkiqczjgfcievstk4heaxo55skz32au2mlrndpq"
    ap-singapore-1 = "ocid1.image.oc1.ap-singapore-1.aaaaaaaab2ljowfao3jj2psrqjtdjbzqonvxodaivx5345apram7ynpoho2a"
    ap-sydney-1    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaa3jmqelz5tcnvmisee7vs5rnhsfkrtjx7cji7n7c6u3awlfhjdyaq"
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaac2t4hu43w4fxidje6tou6wu5f5pujjvdyz2prad35hqwynh75akq"
    ca-montreal-1  = "ocid1.image.oc1.ca-montreal-1.aaaaaaaadfhn7j3u54zzeee3yypjobjisip3kyzvw5tkbkpnqy2o3t3yvola"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaawic6nz26r5fvodevtiei27ohhnwl5rqrsckzfuapvcyhxnzbsrxa"
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaay6zfpemgnbz7qd2qhu4vaqrysamowb44hmnqn2xt243s3ekjwvba"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa6ueulrtedgclrxznl5pkzhzseddl7b6iq6jhdl3vjm62zhddpxta"
    eu-marseille-1 = "ocid1.image.oc1.eu-marseille-1.aaaaaaaaoygutjey3po3dwskuov5wr2t7rz7oiwscnwentxlt6fk4jknpylq"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaatqomsnqxsskhlue3ywdk2ufbnj6brdkwcv4vcqdyuo6o6bd3tqzq"
    il-jerusalem-1 = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaao4hpsggrrqkqo6ge4jtg2g3d3z4dsiok6kssylnx2s76yg4glvaa"
    me-dubai-1     = "ocid1.image.oc1.me-dubai-1.aaaaaaaakuda55qjhk4doqpws6cqt5uexdw6wndk6qlsenol7a6rdsfuqkva"
    me-jeddah-1    = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa5jt7s32wmhfcvsgmf2unzhmo5unmhzxl6a3altixycqn5hbmrzjq"
    sa-santiago-1  = "ocid1.image.oc1.sa-santiago-1.aaaaaaaarks4g6teevdxaoodmijwhkolpokdz7lomec7hi5mq3wjxmawhqzq"
    sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa5kez3m6k5ojrr5vahxsk7pdhs4xldgj2v4pecx234lviacenhqxq"
    sa-vinhedo-1   = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaa4pujkfvmesybqkmlhioambpfuq7bjuwhzzdtbl6tbjc4hwrylerq"
    uk-cardiff-1   = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaahpjgh3b2i5tjs6ajfdwu3ldbtq3k5e4i4nqrj3akux74hpyk6tea"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaa7vmmzcxwdnhxxfzuguh64yvvsunkvyoumr4qdcqjb4muwodxrvca"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaa2tex34yxzqunbwnfnat6pkh2ztqchvfyygnnrhfv7urpbhozdw2a"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaap6n3pdn4xiiyba6plfdq5nq5infnmkjm3nw7romlftpudjmro3ka"
    us-sanjose-1   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaacdzh2e4tcrxowru2ygh62eiqp4iu2q2io3ippaqdtxks2ojtw5uq"
  }
}
