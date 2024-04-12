# docker-couchpotato-old

Dockerfile to containerize the old classic Couchpotato.
Take note: this is built on Alpine 3.11, Python 2.7.18 and pip 20.0.2.

1. Build & run the docker
2. Run update from within Couchpotato

## Build

    docker build --tag lennong/couchpotato https://github.com/lennong/docker-couchpotato-old.git

## Run

    docker run -d -p 5050:5050 -v /media:/media --restart=always --name couchpotato lennong/couchpotato

## docker-compose

    version: "3"
    services:
      couchpotato:
      image: lennong05/couchpotato-old
      container_name: couchpotato
      environment:
        - PUID=1000
        - PGID=1000
        - TZ=Europe/Stockholm
      volumes:
        - /config:/config #to access couchpotato's config file from host
        - /media:/media #to access host's media files from couchpotato
      ports:
        - 5050:5050
      restart: unless-stopped

## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
