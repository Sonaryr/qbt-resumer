# qbt-resumer

Restart your errored qBittorrent downloads automatically

## Getting Started

These instructions will cover usage information and for the docker container

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Quickstart

```shell
docker run sonaryr/qbt-resumer:latest
```

Or in a compose file

```shell
services:
  qbt-resumer:
    environment:
      - QBT_USER=admin
      - QBT_PASSWORD=adminadmin
      - QBT_URL=http://localhost:8080
      - QBT_RECHECK_SECONDS=60
    container_name: qbt-resumer
    image: sonaryr/qbt-resumer:latest
    restart: unless-stopped    
```

#### Environment Variables

* `QBT_USER` - username for the Web UI of qBittorrent (defaults to `admin`)
* `QBT_PASSWORD` -  password for the Web UI of qBittorrent (defaults to `adminadmin`)
* `QBT_URL` -URL for the Web UI of qBittorrent (defaults to `http://localhost:8080`)
* `QBT_RECHECK_SECONDS` - amount of seconds the script will sleep before rechecking again (defaults to `60`)

## Built With

* [qbittorrent-cli](https://github.com/fedarovich/qbittorrent-cli)

## Authors

* **Sonaryr** - *Initial work* - [Sonaryr](https://github.com/Sonaryr)

See also the list of [contributors](https://github.com/your/repository/contributors) who
participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.