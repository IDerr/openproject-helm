# <span>OpenProject.org</span> Helm Chart 

## What is OpenProject?

> "***Open source project management software***.  
> *Efficient classic, agile or hybrid project management in a secure environment*.
> *Established in 2012, OpenProject supports projects throughout the whole life-cycle*". - <span>OpenProject.org</span>

## TL;DR

```bash
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm dependency update
$ helm install openproject <HELM_REPO>/openproject
```

## Introduction

This chart bootstraps an [OpenProject.org](https://openproject.org) deployment on a Kubernetes cluster using the Helm package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release <HELM_REPO>/openproject
```

The command deploys OpenProject on the Kubernetes cluster in the default configuration. The [***parameters***](#parameters) section lists the parameters that can be configured during installation.

> Tip: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components but PVC's associated with the chart and deletes the release.

## Dependencies

Please, make sure to read those documentations bellow to know how to set them up.

- **Memcached**
  https://github.com/bitnami/charts/tree/master/bitnami/memcached

- **PostgreSQL**
  https://github.com/bitnami/charts/tree/master/bitnami/postgresql

## Parameters

> TBD

## License

Apache License, Version 2.0

> Apache 2.0

***Keep C.A.L.M.S. and kick unqualified Cloud Native Solutions out***