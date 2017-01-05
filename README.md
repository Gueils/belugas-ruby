![belugas.png](belugas.png)

## Overview

`belugas-ruby` is a command line interface for the Belugas feature detection analysis
platform. It allows you to run feature detector Ruby engines on your local machine inside
of Docker containers.

## Prerequisites

The Belugas Ruby CLI is distributed and run as a [Docker](https://www.docker.com) image. The engines that
perform the actual analyses are also Docker images. To support this, you must have Docker installed
and running locally. We also require that the Docker daemon supports connections
on the default Unix socket `/var/run/docker.sock`.

## Installation

```console
docker pull icalialabs/belugas-ruby:latest
```

## Usage

### 1: Standard (Non-development)
```console
docker run \
  --interactive --tty --rm \
  --volume "$PWD":/code \
  icalialabs/belugas-ruby
```

### 2: Development:
```
plis run app belugas-ruby
```

## Copyright

See [LICENSE](LICENSE)
