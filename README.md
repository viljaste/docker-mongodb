# docker-mongodb

A [Docker](https://docker.com/) container for [MongoDB](http://www.mongodb.org/).

## Run the container

Using the `docker` command:

    CONTAINER="mongodbdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mongodb/data \
      simpledrupalcloud/data:latest

    CONTAINER="mongodb" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 27017:27017 \
      --volumes-from mongodbdata \
      -d \
      simpledrupalcloud/mongodb:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mongodb.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mongodb.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/mongodb:latest . \
      && cd -

## Back up MongoDB data

    sudo docker run \
      --rm \
      --volumes-from mongodbdata \
      -v $(pwd):/backup \
      simpledrupalcloud/data:latest tar czvf /backup/mongodbdata.tar.gz /mongodb/data

## Restore MongoDB data from a backup

    sudo docker run \
      --rm \
      --volumes-from mongodbdata \
      -v $(pwd):/backup \
      simpledrupalcloud/data:latest tar xzvf /backup/mongodbdata.tar.gz

## License

**MIT**
