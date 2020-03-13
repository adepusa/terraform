provider "docker" {

}

resource "docker_image" "ubuntu-image" {
        name="ubuntu:16.04"
}

resource "docker_image" "centos_image" {
        name="ubuntu:latest"
}

resource "docker_container" "ubuntu-container1"{
        name="ubuntu-container1"
        image=docker_image.centos_image.latest
        command=["tail","-f","/dev/null"]
        must_run="true"
}

resource "docker_container" "ubuntu-container2"{
        name="ubuntu-container2"
        image=docker_image.ubuntu-image.name
        command=["tail","-f","/dev/null"]
        must_run="true"
}
