
# Environment Variables

$OCI_COMPARTMENT_ID = "ocid1.tenancy.oc1..aaaaaaaa3vzjiz7354idew4yjfbcjqah3bywaz2p2hrhvchdfpcfaw5qkmjq"
$OCID_ROUTE_TABLE = "<OCID_ROUTE_TABLE>"
$OCID_SECURITY_LIST = "<OCID_SECURITY_LIST>"

# 1. Create a Virtual Cloud Network (VCN) in Oracle Cloud Infrastructure (OCI) using OCI CLI

oci network vcn create `
  --cidr-block "10.0.0.0/16" `
  --compartment-id $OCI_COMPARTMENT_ID `
  --display-name "CLI_VCN"

# ToDo: Needs to store the OCID of the created VCN for later use.

$VCN_ID = "<OCID_VCN>"

# cidr-block: The CIDR block for the VCN.
# compartment-id: The OCID of the compartment where the VCN will be created.
# display-name: A user-friendly name for the VCN.

# 2. Create an Internet Gateway (IGW) for the VCN

oci network internet-gateway create `
  --compartment-id $OCI_COMPARTMENT_ID `
  --vcn-id $VCN_ID `
  --is-enabled true `
  --display-name "igw-main"

# 3. Create Route table

oci network route-table update `
  --rt-id $OCID_ROUTE_TABLE `
  --route-rules '[{"cidrBlock":"0.0.0.0/0","networkEntityId":"<OCID_IGW>"}]'

# 4. Criar a Submet

oci network subnet create `
  --compartment-id $OCI_COMPARTMENT_ID `
  --vcn-id $VCN_ID `
  --cidr-block "10.0.1.0/24" `
  --route-table-id <OCID_ROUTE_TABLE> `
  --security-list-ids '["$OCID_SECURITY_LIST]' `
  --display-name "subnet-public" `
  --prohibit-public-ip-on-vnic false

