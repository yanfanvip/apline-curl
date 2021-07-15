FROM alpine
MAINTAINER Fritz.F.Yan <fritz.f.yan@newegg.com>
ENV GLIBC_VERSION=2.33-r0
/bin/sh -c apk add --update curl && curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub &&   curl -Lo glibc.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" &&   curl -Lo glibc-bin.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" &&   apk add glibc-bin.apk glibc.apk &&   /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib &&   echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf &&   rm -rf glibc.apk glibc-bin.apk /var/cache/apk/*
