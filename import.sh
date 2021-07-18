#!/bin/bash
docker-compose up -d endpoint
docker-compose exec endpoint \
    wget   https://github.com/mintproject/fuseki-docker/blob/master/backups/modelCatalog-1.8.0.nq.gz?raw=true -O /tmp/modelCatalog-1.8.0.nq.gz
docker-compose exec endpoint \
    /jena/bin/tdbloader2   \
        --loc=/fuseki-base/databases/new_dataset \
        /tmp/modelCatalog-18.0.nq.gz
docker-compose exec endpoint \
    rm -rf /fuseki-base/databases/modelCatalog
docker-compose exec endpoint \
    mv /fuseki-base/databases/new_dataset /fuseki-base/databases/modelCatalog
docker-compose restart endpoint
