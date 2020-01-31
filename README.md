# helm-eks

Supported tags and release links

* [3.0.3](https://github.com/elvenworks/helm-eks/releases/tag/3.0.3) - helm v3.0.3, kubectl v1.17.2, aws-iam-authenticator v.0.5.0 alpine 3.11

## Overview

This lightweight alpine docker image provides kubectl and helm binaries for working with a Kubernetes cluster. A local configured kubectl is a prerequisite to use helm per helm documentation. This image is useful for general helm administration such as deploying helm charts and managing releases. It is also perfect for any automated deployment pipeline needing to use helm which supports docker images such as Concourse CI, Jenkins on Kubernetes, Travis CI, and Circle CI. Having bash installed allows for better support for troubleshooting by being able to exec / terminal in and run desired shell scripts. Git installed allows installation of helm plugins.

## Run

Example for use with personal administration or troubleshooting with volume mount for kubeconfig and aws files:  
`docker run -ti --rm -v ~/.aws -v ~/.kube:/root/.kube elvenworks/helm-eks:latest `  
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube). Same for aws config files to authenticate with your kubernetes cluster on EKS (AWS). Directory (~/.aws) the container's Kubernetes configuration directory (root/.aws).

## Build

For doing a manual local build of the image:  
`docker build -t yourTagHere .`
