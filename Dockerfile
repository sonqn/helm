FROM alpine:3.18.2

ENV HELM_LATEST_VERSION v3.12.2
ENV KUBE_LATEST_VERSION v1.26.0

RUN apk add -U ca-certificates git curl && \
    apk add -U -t deps curl && \
    curl -o helm.tar.gz https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && \
    chmod +x /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    rm helm.tar.gz && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk del --purge deps && \
    rm /var/cache/apk/*

RUN helm version
