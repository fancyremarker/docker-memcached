# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/memcached

[![Docker Repository on Quay.io](https://quay.io/repository/aptible/memcached/status)](https://quay.io/repository/aptible/memcached)

Memcached on Docker, with SASL support

## Installation and Usage

    docker pull quay.io/aptible/memcached
    docker run quay.io/aptible/memcached

### Specifying a password at runtime

    docker run -e PASSWORD=foobar docker run quay.io/aptible/memcached memcached-sasl

## Available Tags

* `latest`: Currently memcached 1.4.14

## Tests

Tests are run as part of the `Dockerfile` build. To execute them separately within a container, run:

    bats test

## Deploying As An App On Aptible

To deploy as an Aptible app, just create an app on Dashboard with a new handle, say `my-memcached-handle`. Then, configure a password (or edit your Procfile to use the default `memcached` instead of `memcached-sasl`):

    aptible config:add --app my-memcached-handle PASSWORD=your-password

Finally, clone and push the repo to Aptible:

    git clone https://github.com/aptible/docker-memcached
    git remote add aptible git@beta.aptible.com:my-memcached-handle.git
    git push aptible master

## Deploying Images To Quay

To push the Docker image to Quay, run the following command:

    make release

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2014 [Aptible](https://www.aptible.com), [Frank Macreery](https://github.com/fancyremarker), and contributors.
