# OpenProject.org[]() Helm Chart

## What is OpenProject?

> "***Open source project management software***.\
> *Efficient classic, agile or hybrid project management in a secure environment*.\
> *OpenProject supports projects throughout the whole life-cycle*". – [OpenProject.org](https://openproject.org)

### OpenProject Community live

The online community project where the development of the OpenProject software
and plugins takes place.

Check it out there:
> https://community.openproject.org/projects/openproject/


## TL;DR

### Are you looking forward for a demo?

#### Rancher catalog

Custom catalogs can be added into Rancher at a global scope, cluster scope, or project scope.

**Prerequisite**: as *admin* or *cluster onwership* role you has the ability to add or remove cluster or project catalogs in Rancher.

- Catalog:
  - Name: `adrianovieira`
  - URL: `https://gitlab.com/api/v4/projects/28363496/packages/helm/stable`
  - Helm version: `v3`

Them launch an "***Apps***" based on this catalog!

Check this documentation out if you need any details:
> Rancher - Adding Catalog Repositories (in cluster or project level):\
> https://rancher.com/docs/rancher/v2.x/en/helm-charts/legacy-catalogs/adding-catalogs/

#### Helm chart

***Hey! These settings are for demonstration purposes only - and to calm down your anxiety...***

```bash
$ helm repo add adrianovieira https://gitlab.com/api/v4/projects/28363496/packages/helm/stable
$ helm repo update
$ helm install openproject adrianovieira/openproject \
                --set "ingress.enabled=true" \
                --set "ingress.hosts[0].paths[0].path=/" \
                --set "persistence.enabled=false" \
                --set "postgresql.persistence.enabled=false" \
                --set "ingress.hosts[0].host=OPENPROJECT.DOMAIN-CHANGE.ME"

$ helm uninstall openproject
```

## Introduction

This chart bootstraps an [OpenProject.org](https://openproject.org) deployment
on a Kubernetes cluster using the Helm package manager.

## Prerequisites

- Rancher-2.4+ [^rancher] or Kubernetes 1.12+
- Helm 3.1+
- PV provisioner support in the underlying infrastructure

> ***Attention***:\
> *Application storage root path is (fixed awhile)*: `/var/openproject`.

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

Please, make sure to read those documentations to know how to set their parameters up.

- **Memcached**
  https://github.com/bitnami/charts/tree/master/bitnami/memcached

- **PostgreSQL**
  https://github.com/bitnami/charts/tree/master/bitnami/postgresql

## Parameters

### OpenProject.org[]() parameters

| Name                            | Description                                                                                         | Value                           |
| ------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------- |
| `openProjectEnv`                | Set custom environment variables to configure OpenProject                                           | `{}`, read [bellow](#openprojectorg-environment-variables)|
| `image.registry`                | OpenProject image registry                                                                          | `docker.io`                     |
| `image.repository`              | OpenProject image repository                                                                        | `openproject/community`         |
| `image.tag`                     | OpenProject image tag (immutable tags are recommended)                                              | `11.3.3`                        |
| `image.pullPolicy`              | OpenProject image pull policy                                                                       | `IfNotPresent`                  |
| `image.pullSecrets`             | Specify image pull secrets                                                                          | `[]`                            |
| `persistence.enabled`           | Enable persistence using PVC                                                                        | `true`                          |
| `persistence.existingClaim`     | Provide an existing `PersistentVolumeClaim`                                                         | `""`                            |
| `persistence.size`              | PVC Storage Request for OpenProject volume                                                          | `8Gi`                           |
| `persistence.accessMode`        | PVC Access Mode for OpenProject volume                                                              | `ReadWriteOnce`                 |
| `ingress.enabled`               | Set to true to enable ingress record generation                                                     | `false`                         |
| `ingress.hosts`                 | When the ingress is enabled, a host pointing is created                                             | `[]`, e.g.: `openproject.local` |
| `ingress.tls`                   | TLS secret to be used when the ingress is enabled                                                   | `[]`                            |
| `postgresql.enabled`            | Set to `true` to enable deploy *PostgreSQL* on Kubernetes or `false` to an external database server | `true`                          |
| `postgresql.auth.database` | Set PostgreSQL database name                                                                        | `openproject`                   |
| `postgresql.auth.username` | Set PostgreSQL database username                                                                    | `openproject`                   |
| `postgresql.auth.password` | Set PostgreSQL database password                                                                    | `S3cr3t-ch2nge-me`              |
| `postgresql.host`               | If an external database server, set the `hostname` of PostgreSQL                                    | `postgresql-server.local`       |
| `postgresql.port`               | If an external database server, set the `port` of PostgreSQL                                        | `5432`                          |
| `memcached.enabled`             | Set to `true` to enable deploy Memcached on Kubernetes or `false` to an external *Memcached* server.<br> Set `OPENPROJECT_CACHE__MEMCACHE__SERVER` on the secret created already                                                                     | `true`                      |

Check more options on [`values.yaml`](values.yaml).

#### OpenProjectorg[]() environment variables

Setting custom environment variables to configure OpenProject, e.g.:

```yaml
openProjectEnv:
  FOO: 'YmFyCg==' # bar
  BAR: 'Zm9vCg==' # foo
  OPENPROJECT_CACHE__MEMCACHE__SERVER: bWVtY2FjaGUtc2VydmVyLmxvY2Fs # memcache-server.local
  OPENPROJECT_SHOW__COMMUNITY__LINKS: dHJ1ZQ== # true
  # ...
```

> All variables' values needs to be encoded in `base64` standard.

## Authors

- Mantainer: [Empresa Brasil de Comunicação](https://ebc.com.br)
- Upstream repo: https://gitlab.com/adrianovieira/openproject.org-helm-chart

## License

Apache License, Version 2.0

> Apache 2.0

***Keep C.A.L.M.S. and kick unmanaged projects out...***
