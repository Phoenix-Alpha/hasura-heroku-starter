FROM hasura/graphql-engine:v2.1.1.cli-migrations-v2
COPY ./metadata /hasura-metadata

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=false

ENV HASURA_GRAPHQL_DEV_MODE=false

# Heroku hobby tier PG has few limitations including 20 max connections
# https://devcenter.heroku.com/articles/heroku-postgres-plans#hobby-tier
ENV HASURA_GRAPHQL_PG_CONNECTIONS=15

CMD graphql-engine \
    serve \
    --server-port $PORT
