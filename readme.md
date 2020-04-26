# co2-docker
Run [officeweather](https://github.com/aymenfurter/officeweather) (CO2 measurement recording application) containerized.

## Installation
`docker run -t -i --privileged -v /dev/hidraw0:/dev/hidraw0 -p 1080:80 afurter/co2-docker`

If you want persistent data, you have to mount /var/local/monitor

## Open Todos
- Run nginx and cronjob monitor user within Container as separate Nginx user

## License
[MIT](https://choosealicense.com/licenses/mit/)
