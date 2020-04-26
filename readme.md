# co2-docker
Run [officeweather](https://github.com/aymenfurter/officeweather) (CO2 measurement recording application) containerized.

## Installation
`docker run -t -i --privileged -v /dev/hidraw0:/dev/hidraw0 -p 1080:80 afurter/co2-docker`

If you want persistent data, you have to mount /var/local/monitor

## Open Todos
- Run nginx and cronjob monitor user within Container as separate Nginx user

## Sample Docker Compose File
```
---
version: "2"
services:
  co2:
    image: afurter/co2-docker
    privileged: true
    container_name: co2
    volumes:
      - /dev/hidraw0:/dev/hidraw0
      - /opt/appdata/co2:/var/local/monitor
    ports:
      - 1080:80
    restart: unless-stopped
```

## License
[MIT](https://choosealicense.com/licenses/mit/)

