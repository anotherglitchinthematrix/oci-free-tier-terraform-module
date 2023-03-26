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

variable "boot_volume_size_in_gbs" {
  default     = "200"
  description = "Bott volume size in GBs"
  type        = number
}

variable "instance_image_ocid" {
  type = map(string)

  # See https://docs.us-phoenix-1.oraclecloud.com/images/
  # Canonical-Ubuntu-22.04-Minimal-aarch64-2023.01.30-0
  default = {
    af-johannesburg-1 = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa7r24zjuwnflwiwvsrvxykepfexd3mt47hbasjtwnzh43h6gyl46a"
    ap-chuncheon-1    = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaauypw5uul5aix2qzy5hiwlpyxmcw5nigi43gzqr7i57qtmqq5melq"
    ap-hyderabad-1    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaavvwyupaippqswydsgxircfnqnfafrv4klyi7xv7sxxfhjkkdidnq"
    ap-melbourne-1    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaayl7jqa454eqflsy75v2uwxf2fth6vnx5a2bwivdew4oslskddrxa"
    ap-mumbai-1       = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa7doqtatwelk7f5xpg5k5fk7iz3y7fptottwcrhny2eagjgi6st2q"
    ap-osaka-1        = "ocid1.image.oc1.ap-osaka-1.aaaaaaaas44neqcvhbqf6yuet5nfu4jb5iqmiczl44ktdzh26mdeiybvm33a"
    ap-seoul-1        = "ocid1.image.oc1.ap-seoul-1.aaaaaaaanhwcfyy55mkcymzvdlpmdistmrqsi2roikmwh6btgvzfr3fqedgq"
    ap-singapore-1    = "ocid1.image.oc1.ap-singapore-1.aaaaaaaaymdelabsktw6mnbduy4n6pgfiftwfqrhtba3qrok5j2jdm6rdrba"
    ap-sydney-1       = "ocid1.image.oc1.ap-sydney-1.aaaaaaaa77kkypugf2jbykfwlxvkexktdbpdir7u5rbbxcoaykpatvr2mpqq"
    ap-tokyo-1        = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaa3anu4d2tl4dxuauvb2exur45kcpwfavjbi7bvjs4czcq3onv4c4q"
    ca-montreal-1     = "ocid1.image.oc1.ca-montreal-1.aaaaaaaabmirjhdo5zr5zmg2jzyqdmgfshg4gwrdjitzvp4357my5vmvunsa"
    ca-toronto-1      = "ocid1.image.oc1.ca-toronto-1.aaaaaaaaadthglfrajnhj2qvckfd2xldv3vuihtong72o3vwupi37ngyjmoa"
    eu-amsterdam-1    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaoulin6wnfrbgbtzafwqgm65m35a5dbhhz6eop4p5jd4e2u6ehtda"
    eu-frankfurt-1    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaakxubopeghuhemv5upsqpqqm5bx4m7gxwyevxifcpldpgbubiqfjq"
    eu-madrid-1       = "ocid1.image.oc1.eu-madrid-1.aaaaaaaaohzai37ca7d7jobyrvo43ku6k6ydhlgj27qacgbyj73tzfnc3xaq"
    eu-marseille-1    = "ocid1.image.oc1.eu-marseille-1.aaaaaaaak3ggyv3bc76b3m4434bajex42axcmtze5g4j2lrfpxcbqi6yaffq"
    eu-milan-1        = "ocid1.image.oc1.eu-milan-1.aaaaaaaadtjens5wn4m7pskunip56gvz2pimlzm4yymlefy2hldvgd73ew3a"
    eu-paris-1        = "ocid1.image.oc1.eu-paris-1.aaaaaaaavz2j57ipdxl6nrvqfx4ug2ceypepzpeljpsf3bygjvs3besqjmrq"
    eu-stockholm-1    = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaamypgam3mi7f244r4ffr2ermg4w2yrskdnq67utkww6w7vk2rprlq"
    eu-zurich-1       = "ocid1.image.oc1.eu-zurich-1.aaaaaaaasqeybprh6sczzsmmxnfdarqc7es36orid3lksaimbnp4y3vnlyya"
    il-jerusalem-1    = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaaujg7xpqu2u3dqb5dtmnxjskkv65xwutzqjgo3emdtt6almdqdi4q"
    me-abudhabi-1     = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaa7crqdtrrpmgu2h6foux4fltynmlsiuo4ead6isut2e7onvxqvyka"
    me-dubai-1        = "ocid1.image.oc1.me-dubai-1.aaaaaaaawuwdthv65usngj354sws6776onvy4olgsmruhcqzvve5b7qre7ya"
    me-jeddah-1       = "ocid1.image.oc1.me-jeddah-1.aaaaaaaabwisonczhajx2zgokbcnwyb4i7arrhvsastyuanlr2mefq6qjtca"
    mx-queretaro-1    = "ocid1.image.oc1.mx-queretaro-1.aaaaaaaaimjhn7ado2ugoaw4iqehnhjliclv44kom4yaexwi7mxdesimpkla"
    sa-santiago-1     = "ocid1.image.oc1.sa-santiago-1.aaaaaaaaadiqnbco7egs2umnubgaqxv64qxs4jfr7gyqb7u5sy56qtgxk4eq"
    sa-saopaulo-1     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaovmgmjdepm5x372pzvkq7nuwhwt3vaiexr3wfweyozl2br5e6wsq"
    sa-vinhedo-1      = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaa6mzns5e24j2xktaik3b6msofzrj5g742uv37j3ekb3xmt5jo3vwq"
    uk-cardiff-1      = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaa6la5v7kdty3dtqopr5ytck3eqhny2ljfeznetcrs4hhs33tfkbsa"
    uk-london-1       = "ocid1.image.oc1.uk-london-1.aaaaaaaamw3hyzuprict2q6cq2jgw7jav5f4jro5g3gxk7r5hmyvw7usa5nq"
    us-ashburn-1      = "ocid1.image.oc1.iad.aaaaaaaa33a3lofqhzh5wvpi34fnsqiwdwaytjls52pksm7r5kinnp6ew3na"
    us-chicago-1      = "ocid1.image.oc1.us-chicago-1.aaaaaaaamg2tx4iuu2dr2p5cgngnrzxi5nh33veph2pbzvu6m3xudcvrw57a"
    us-phoenix-1      = "ocid1.image.oc1.phx.aaaaaaaat6pgdmeop4tt7yxp7v4mjzwudsbhnvx6svrzucaxt7ckihr2ndfq"
    us-sanjose-1      = "ocid1.image.oc1.us-sanjose-1.aaaaaaaaei5sl22nkrp56zblg5up25szrkfqwytyi3nwq44paezizmceareq"
  }
}
