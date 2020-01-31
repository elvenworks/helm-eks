FROM alpine:3.11

# Note: Latest version of aws-iam-authenticator may be found at:
# https://github.com/kubernetes-sigs/aws-iam-authenticator/releases
ENV AWS_IAM_AUTHENTICATOR_LATEST_VERSION="v0.5.0"

RUN apk add --update ca-certificates bash gnupg jq py-pip \
  && apk add --update -t deps curl gettext \
  && pip install awscli \
  && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/${AWS_IAM_AUTHENTICATOR_LATEST_VERSION}/aws-iam-authenticator_${AWS_IAM_AUTHENTICATOR_LATEST_VERSION}_linux_amd64 -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/aws-iam-authenticator

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.17.2"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.0.3"

RUN apk add --no-cache ca-certificates bash git openssh curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

WORKDIR /config
ENV KUBECONFIG=/root/.kube/config

CMD ["bash"]
