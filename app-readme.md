# OpenProject.org[]() Helm Chart

## What is OpenProject?

> "***Open source project management software***.\
> *Efficient classic, agile or hybrid project management in a secure environment*.\
> *OpenProject supports projects throughout the whole life-cycle*". – [OpenProject.org](https://openproject.org)

## OpenProject Community live

The online community project where the development of the OpenProject software and plugins takes place.

Check it out there:
> https://community.openproject.org/projects/openproject/

## Dependencies

Please, make sure to read those documentations to know how to set their parameters up.

- **Memcached**  
  https://github.com/bitnami/charts/tree/master/bitnami/memcached

- **PostgreSQL**  
  https://github.com/bitnami/charts/tree/master/bitnami/postgresql

> ***Attention***:\
> *Application storage root path is (fixed awhile)*: `/var/openproject`.

## Are you looking forward for a demo?

Take the following environment variables and fill it in the "***Answers***" bellow

Hey! These settings are for demonstration purposes only - and to calm down your anxiety..

```bash
ingress.hosts[0].host=OPENPROJECT.DOMAIN-CHANGE.ME
ingress.enabled=true
ingress.hosts[0].paths[0].path=/
persistence.enabled=false
postgresql.persistence.enabled=false
```
