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