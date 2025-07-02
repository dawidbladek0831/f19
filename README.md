# AI-based Text-to-Speech (TTS) System

## System Purpose
The purpose of this system is to provide high-quality text-to-speech (TTS) synthesis using artificial intelligence. The system aims to offer a natural-sounding voice output suitable for various applications such as assistive technology, audiobooks, and customer service automation.

# Setup
## IAM
Run keycloak and postgresDB:

     docker-compose -p f19 -f .\.docker\docker-compose-auth.yaml up -d


Config realm
- Create realm using file realm-export.json
- Create user
- Regenerate Client Secret in fss Client

## Supporting infrastructure
Kafka

    docker-compose -p f19 -f .\.docker\docker-compose-kafka.yaml up -d


Mongo

    docker-compose -p f19 -f .\.docker\docker-compose-mongo.yaml up -d


## File Storage Service
FFS

    docker-compose -p f19 -f .\.docker\docker-compose-file_storage_service.yaml up -d

# docker
## front
build image

    
    sudo docker buildx build . -f ./.docker/Dockerfile -t ghcr.io/dawidbladek0831/f19-front:latest
    docker push  ghcr.io/dawidbladek0831/f19-front:latest
    
## synthesizer
build image


    sudo docker buildx build . -f .docker/Dockerfile -t ghcr.io/dawidbladek0831/synthesizer:latest
    docker push ghcr.io/dawidbladek0831/synthesizer:latest
    
# kubernetes
## setup
make soure that u are auth in gcloud


    $ gcloud init

make sure that google-cloud-cli-gke-gcloud-auth-plugin is available

    $ sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin

## enviroment


    $ terraform -chdir=.kubernetes/base/env init
    $ terraform -chdir=.kubernetes/base/env apply 


get kubeconfig


    $ gcloud container clusters get-credentials f-gke-cluster --zone europe-central2-a --project f-projects-463016

## cluster

apply cert-manager


    $ kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml


config .env file based on .env.example file

run shared scripts

    $ sh .kubernetes/shared/apply.sh

run dev scripts

    $ sh .kubernetes/dev/apply.sh

run f19-dev scripts

    $ sh .kubernetes/f19-dev/apply.sh