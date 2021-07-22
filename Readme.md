# What is OpenProject?

> "***Open source project management software***
> *Efficient classic, agile or hybrid project management in a secure environment.
> Established in 2012, OpenProject supports projects throughout the whole life-cycle.
> All development (source code) takes place in our public repositories on [Github](https://github.com/opf/openproject)."*

https://openproject.org

## TL;DR

```bash
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm dependency update
$ helm install openproject --namespace openproject --set image.tag=1.21.1,replicaCount=1 ./
```

# Introduction

This chart bootstraps a OpenProject deployment on a Kubernetes cluster using the Helm package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

## dependencies

Please, make sure to read those documentations bellow to know how to set them up.

- **Memcached**
  https://github.com/bitnami/charts/tree/master/bitnami/memcached

- **PostgreSQL**
  https://github.com/bitnami/charts/tree/master/bitnami/postgresql
