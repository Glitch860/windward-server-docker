# windward

[Windward](http://www.tasharen.com/windward) game server over minimal alpine distribution.

**Only for testing, not stable yet.**

## Environment

- **WINDWARD_PUBLIC:** Start as public server.
- **WINDWARD_SERVER_NAME:** Server name.
- **WINDWARD_SERVER_WORLD:** World name.
- **WINDWARD_SERVER_PORT:** TCP Server port (**Default: 5127**).
- **WINDWARD_ADMINS:** Admin steam id's, comma separated.

## Volumes

- **```/windward/Worlds```**: World map

## Execution examples

- ``` docker run -d -e WINDWARD_SERVER_NAME=Testing -p 5127:5127/tcp --name windward-server reimashi/windward:latest ```
- [Docker Compose example on repository](https://github.com/reimashi/windward-docker/blob/master/docker-compose.yml).

# Forked changes
Updated the docker-compose file to give an example of how to host this docker server image on an NFS share volume for persistent storage. 
