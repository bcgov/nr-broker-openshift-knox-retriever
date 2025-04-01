FROM docker.io/library/alpine
RUN apk --update add jq
RUN apk --update add curl
ARG BROKER_URL="https://nr-broker-test.apps.silver.devops.gov.bc.ca"
ARG VAULT_ADDR="https://vault-iit-test.apps.silver.devops.gov.bc.ca"
ENV BROKER_URL=$BROKER_URL
ENV VAULT_ADDR=$VAULT_ADDR
ENV BROKER_JWT="JWT"
ENV ROLE_ID="role_id"
ENV PROVISION_NAME="name"
ENV EVENT_URL="url"
ENV USER="user"

RUN mkdir /broker

COPY ./scripts/get-vault-token.sh /broker
RUN chmod +x /broker/get-vault-token.sh
VOLUME /broker/config 
VOLUME /broker/output
WORKDIR /broker
# Set the entrypoint to the script with CMD arguments
ENTRYPOINT ["./get-vault-token.sh"]
CMD [BROKER_JWT,ROLE_ID,PROVISION_NAME,EVENT_URL,USER]