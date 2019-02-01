
# squash_tm



#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with squash_tm](#setup)
    * [What squash_tm affects](#what-squash_tm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with squash_tm](#beginning-with-squash_tm)
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

For external database you need to create an empty db and  load the db files ie : 
cd /usr/share/dbconfig-common/data/squash-tm/install/
psql -h dbserver -p 5432 -U squashtm -W squashtm < pgsql


### Beginning with squash_tm

include squash_tm

## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
