docker-zookeeper-ui
===================

Wraps DeemOpen's zkui project inside Docker.

## Build image

The following command is wraps the _docker build_ command so you have less typing.

```
./build_image.sh
```

## Run image

When the image is run, you need to inform it which Zookeeper Ensemble it will use. The first parameter does that. The second
parameter specifies the host port where the web application can be reached.

```
./run_image.sh [zookeeper_ensemble] [host_port]
```

### Example

```
$ ./run_image.sh 50.116.46.24:5555 9090
Connect to the Zookeeper Web Application using http://70.113.41.289:9090/
$ docker ps
CONTAINER ID   IMAGE                                PORTS                    NAMES
f99f695baac6   medined/docker-zookeeper-ui:latest   0.0.0.0:9090->9090/tcp   zookeeper-ui-for-50_116_46_24_5555
```

If your host server is located at 70.113.41.289, you should be able to visit http://70.113.41.289:9090 to explore your Zookeeper information.

