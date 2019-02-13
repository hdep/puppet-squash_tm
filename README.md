
# squash_tm

[![Build Status](https://travis-ci.org/hdep/puppet-squash_tm.png?branch=master)](https://travis-ci.org/hdep/puppet-squash_tm)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with squash_tm](#setup)
    * [What squash_tm affects](#what-squash_tm-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module install sqush-tm software on Debian 9 
https://www.squashtest.org/

## Setup

### What squash_tm affects **OPTIONAL**

* /etc/default/squash configuration file
* Add apt repository and key
* Install squash-tm package


### Setup Requirements **OPTIONAL**

For external database you need to create an empty db and load the db files first ie : 

```
cd /usr/share/dbconfig-common/data/squash-tm/install/
psql -h dbserver -p 5432 -U squashtm -W squashtm < pgsql
```

## Usage

Simply include/contain/required/declare the squash_tm class : 

```
include 'squash_tm'
```

It includes a few sane defaults, so it should work out of the box.
However, we recommend that you declare the class and override a few parameters:

* In the module

```
class { 'squash_tm':
     apt_proxy => 'http://myproxy.domain.local:3128'
     db        => 'postgresql'
}
```

* In hieradata 

```
squash_tm::apt_proxy: http://myproxy.domain.local:3128
squash_tm::db: postgresql
squash_tm::db_username: squashtm
squash_tm::db_password: mypassword
squash_tm::db_server: mydbserver
squash_tm::db_port: 5432
```

## Limitations

Only tested for Debian 9 with puppet 5  

## Development

If you want to improve this module, send us a patch of pull request!

TO DO :

- add support for other OS
- add option for managing apache2 frontend,
- find a way to automatically load data into remote DB,
- add option for deploying local DB (postgresql or mysql) 
- add some rspec test 


