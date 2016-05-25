#!/bin/sh

set -e

# Directory to store certificates in
CERTIFICATE_DIRECTORY=/certs

# The address of the kubernetes master to create the certificate for
KUBERNETES_MASTER_ADDRESS=$1

if [ -z $KUBERNETES_MASTER_ADDRESS ]; then
    echo "No Kubernetes master address supplied"
    exit 1
fi

mkdir -p ${CERTIFICATE_DIRECTORY}

# Generate a certificate authority key
openssl genrsa -out ${CERTIFICATE_DIRECTORY}/ca.key 2048

# Generate a certificate authority certificate
openssl req -x509 -new -nodes \
    -key ${CERTIFICATE_DIRECTORY}/ca.key \
    -subj "/CN=${KUBERNETES_MASTER_ADDRESS}" \
    -days 10000 \
    -out ${CERTIFICATE_DIRECTORY}/ca.crt

# Generate a server key
openssl genrsa -out ${CERTIFICATE_DIRECTORY}/server.key 2048

# Generate a server certificate signing request 
openssl req -new -key ${CERTIFICATE_DIRECTORY}/server.key \
    -subj "/CN=${KUBERNETES_MASTER_ADDRESS}" \
    -out ${CERTIFICATE_DIRECTORY}/server.csr

# Generate a server certificate
openssl x509 -req -in ${CERTIFICATE_DIRECTORY}/server.csr \
    -CA ${CERTIFICATE_DIRECTORY}/ca.crt \
    -CAkey ${CERTIFICATE_DIRECTORY}/ca.key \
    -CAcreateserial \
    -days 10000 \
    -out ${CERTIFICATE_DIRECTORY}/server.crt 

exec nginx
