# co2-docker

A dockerfile to run [officeweather](https://github.com/aymenfurter/officeweather)

## Installation
`docker run -t -i --privileged -v /dev/hidraw0:/dev/hidraw0 -p 1080:80 afurter/co2-docker`

If you want persistent data, you have to mount /var/local/monitor

## Open Todos
- Run nginx and cronjob monitor user within Container as separate Nginx user


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
