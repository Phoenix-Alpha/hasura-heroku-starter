#! /bin/bash
docker run -p 8080:8080 \
       --net=host \
       -v /migrations:/hasura-migrations \
       -v /metadata:/hasura-metadata \
       -e HASURA_GRAPHQL_DATABASE_URL="postgres://db_admin:password@localhost:5432/db_development" \
       -e HASURA_GRAPHQL_ENABLE_CONSOLE=true \
       -e HASURA_GRAPHQL_DEV_MODE=true \
       -e HASURA_GRAPHQL_SERVER_PORT=8080 \
       -e HASURA_GRAPHQL_ENABLE_ALLOWLIST=false \
       -e HANDLER_WEBHOOK_BASEURL=http://localhost:3000 \
       hasura/graphql-engine:v2.1.1
