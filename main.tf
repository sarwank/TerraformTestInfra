resource "aws_instance" "this" {
  instance_type          = "t2.micro"
  ami                    = "ami-0ed9277fb7eb570c9"
  availability_zone      = "us-east-1"
  key_name               = "key-0ea61142aa350dc80"                            # the name of the SSH keypair to use for provisioning
  vpc_security_group_ids = ["sg-0f6b5e7326b0dc43c"]
  #subnet_id              = "${data.aws_subnet.this.id}"
  #user_data              = "${sha1(local.reprovision_trigger)}"                 # this value isn't used by the EC2 instance, but its change will trigger re-creation of the resource
  #tags                   = "${merge(var.tags, map("Name", "${var.hostname}"))}"
  #volume_tags            = "${merge(var.tags, map("Name", "${var.hostname}"))}" # give the root EBS volume a name (+ other possible tags) that makes it easier to identify as belonging to this host

  root_block_device {
    volume_size = "8"
  }
