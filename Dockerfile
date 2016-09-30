
FROM debian:jessie

RUN apt-get update && \
    apt-get -y install git quilt kpartx realpath qemu-user-static debootstrap zerofree pxz zip 

ADD . /build 

CMD ln -s /artifacts /build/deploy && \
    /build/build.sh 