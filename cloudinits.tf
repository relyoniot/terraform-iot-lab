# Template for es cloud-init bash
resource "template_file" "init_es" {
    template = "${file("init_es.tpl")}"
}
