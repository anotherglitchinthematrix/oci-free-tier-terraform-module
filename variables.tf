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
  # Canonical-Ubuntu-22.04-Minimal-aarch64-2023.04.18-0
  default = {
    af-johannesburg-1 = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa46as6w7hwj7tlxphtspc5qumxmhyutdgrjqalxuskm4w5p4qyida"
    ap-chuncheon-1    = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaah6cio7g5erg3yp4wqyfbu3whtte3hwv4kkdcpnhp4s4xnnjgsuca"
    ap-hyderabad-1    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaasvngrh46jozz2uzs4wliqhjaf4ztzwljdpx47urdnffdqlodxgaa"
    ap-melbourne-1    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaadyanfyfn6yenhj6kmoqmvlxlecdfvitsfoqmekmo5wi2tc7oixcq"
    ap-mumbai-1       = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaamhrpfp2nyulgzq3kfqktgq63tvhiqibs4hobsfokek3v4odo5bna"
    ap-osaka-1        = "ocid1.image.oc1.ap-osaka-1.aaaaaaaaliba4aujpehbt3si4o73h66y524lsy2tk5vmbyf65vrc5cw3o55q"
    ap-seoul-1        = "ocid1.image.oc1.ap-seoul-1.aaaaaaaa4o4g4v3u4nv2mtr424z36yaed5hp7jazrxkrjlymkfy77ahmmc5a"
    ap-singapore-1    = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa6ihywkz3f7q6zvux3mfncldtoymvdn2wq3xztjjc3x2n6rgbaoaq"
    ap-sydney-1       = "ocid1.image.oc1.ap-sydney-1.aaaaaaaafyv3xjlybqn77hedfyza4xqj7zomo3sjlqtji5lbozwembozlwba"
    ap-tokyo-1        = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaahsd754q66k7z7unz5d2c27f5mofamlriiy6hs5tl2kecndwc4u5q"
    ca-montreal-1     = "ocid1.image.oc1.ca-montreal-1.aaaaaaaalvgfn6kf2zyv3drlek345dkcsf7zmzycd4jcpbfdxtniyax25vpa"
    ca-toronto-1      = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa5zpkh5zev23zq5veisztq7slcu7gfts4otmgtanry5iqfe777kvq"
    eu-amsterdam-1    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaipeu4hiwyn64rwghjz4qrmyzyaoc6woqpxz7xi3zcwducwvbvqma"
    eu-frankfurt-1    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa4vff5misacsoq2khjgx5qtqtar6gcga2evkqiioorgllxvgksroq"
    eu-madrid-1       = "ocid1.image.oc1.eu-madrid-1.aaaaaaaally4556huuq5blmvbv2flxqeofmew5qo65wks36ngixpogr76oka"
    eu-marseille-1    = "ocid1.image.oc1.eu-marseille-1.aaaaaaaafykzrva3nqeps3utsjynkmcxdzxpju5vxxop2x63jvlwzdbokdma"
    eu-milan-1        = "ocid1.image.oc1.eu-milan-1.aaaaaaaasjia5iz7g3vcvwjs4kro3lwfbnvtidnj2adybtbjg5smrvul5ezq"
    eu-paris-1        = "ocid1.image.oc1.eu-paris-1.aaaaaaaaocaih6zrjlln6ce7tb3hznwmhi336cyiipuvwfoipl6famk2lhxq"
    eu-stockholm-1    = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaa4m6bpcywhorllqqvienyumblosprnze47smo2f22mz3hnq5fa5lq"
    eu-zurich-1       = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaf46j2kf64b3l5chzn2s6ki4mzjlp2um3o2kkmakl6kyat7lxf7aq"
    il-jerusalem-1    = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaahr4m666wfdbw5nswdlcgy2xiwtsesprboy376adkbqtterygdtca"
    me-abudhabi-1     = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaaqb54pk63ecsttkeq637o553fhtqm2j5q2kh3laxxydn42epnz4eq"
    me-dubai-1        = "ocid1.image.oc1.me-dubai-1.aaaaaaaaexhd4f3pgyq7qkbsca33t5esu5evfl76ccxl6byikdzmc7pkf7za"
    me-jeddah-1       = "ocid1.image.oc1.me-jeddah-1.aaaaaaaagv577d6r2en3jwij742vvn3vjedwfiw6l6fhbstgomaywfkshrda"
    mx-queretaro-1    = "ocid1.image.oc1.mx-queretaro-1.aaaaaaaansgqc5ubd2uqxrsqghcp35t5yvlnx2u2gmm54ln4of2sokvin7nq"
    sa-santiago-1     = "ocid1.image.oc1.sa-santiago-1.aaaaaaaa7jqingynezf6emgmtkyls2j64kczba6gbodihar6ngx5d27yakoq"
    sa-saopaulo-1     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaalnfzlq4plimtjcnmejd2p3aoecohlj2uxua5vymsribmpiqtq4la"
    sa-vinhedo-1      = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaatj2ifgx7qo56dahfcxlfqfnogykranvii54ap65ei52gtdb6aiha"
    uk-cardiff-1      = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaa5avfn4gly2p45lnjd6ua62xkk22vrxcqfi56zjospg6aou4774xa"
    uk-london-1       = "ocid1.image.oc1.uk-london-1.aaaaaaaaxjmp3psm5nnrgzvdekifdkzejejzyez67nimpc7itoka3zhb3u2a"
    us-ashburn-1      = "ocid1.image.oc1.iad.aaaaaaaa4kk3vwmrprl7elsawu4yincnkteg5yasljeosdly3x25lljfapka"
    us-chicago-1      = "ocid1.image.oc1.us-chicago-1.aaaaaaaaf2cjsuyrnfwetpeukcyx3yd3pa4eqpx2dqserg55acnjqza24vjq"
    us-phoenix-1      = "ocid1.image.oc1.phx.aaaaaaaalz4kuyiaw2og7u5pg53f2ebbtoh6vp5kldo6gxtl3ztv2auykx2q"
    us-sanjose-1      = "ocid1.image.oc1.us-sanjose-1.aaaaaaaad2hwp2mets2z3yczo5kt4yjn6mphzt6lueh7274o6rns7ob32doq"
  }
}
