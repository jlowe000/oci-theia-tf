output "theia-web_compute_ip_addr" {
  value = oci_core_instance.export_theia-web.public_ip
}

output "theia-ide" {
  value = "https://${oci_core_instance.export_theia-web.public_ip}:8081"
}

output "theia-user" {
  value = var.custom_theia_user
}

output "region" {
  value = var.region
}

output "ssh-web_template" {
  value = "ssh -i ~/.ssh/id_rsa opc@${oci_core_instance.export_theia-web.public_ip}"
}
