# kubernetes-certificate-service

[![](https://img.shields.io/docker/pulls/giantswarm/kubernetes-certificate-service.svg)](https://hub.docker.com/r/giantswarm/kubernetes-certificate-service)

`kubernetes-certificate-service` generates and provides certificates for TLS encryption.

The main purpose of this service is to provide authentication credentials for Kubernetes clusters, primarily for the purpose of encrypting intra-cluster communication. 

On start, the service will generate the necessary certificates, and make them available via HTTP. The same certificates will be returned for all HTTP calls. Kubernetes components can call this service before initialisation and fetch necessary credentials.

Credentials can be accessed via `/ca.crt`, `/server.crt`, and `/server.key`.

See http://kubernetes.io/docs/admin/authentication/ for further information.

## Getting `kubernetes-certificate-service`

Clone the git repository: https://github.com/giantswarm/kubernetes-certificate-service.git

Download the latest docker image from here: https://hub.docker.com/r/giantswarm/kubernetes-certificate-service/

### How to build

`docker build -t giantswarm/kubernetes-certificate-service .`

A Docker Hub automated build is present for building images. These are periodically tagged for releases.

## Running `kubernetes-certificate-service`

`docker run -p 8000:80 giantswarm/kubernetes-certificate-service:0.1 $KUBERNETES_MASTER_ADDRESS`

`$KUBERNETES_MASTER_ADDRESS` is the address of the Kubernetes API Server, and is required for the creation of the certificates.

For example:
```
$ docker run -d -p 8000:80 giantswarm/kubernetes-certificate-service:0.1 kube-master.local
d01c666234375d73e9feda87afee2e78584eebe479ea110e4dcedb6c4972731d
$ curl docker:8000/ca.crt
-----BEGIN CERTIFICATE-----
MIIDCzCCAfOgAwIBAgIJAIOqUUVkuEOBMA0GCSqGSIb3DQEBCwUAMBwxGjAYBgNV
BAMMEWt1YmUtbWFzdGVyLmxvY2FsMB4XDTE2MDUyNTE4NTgzM1oXDTQzMTAxMTE4
```

Note: You may want to mount `/certs` to durable storage, to avoid losing certificates when the container dies.

## Contact

- Mailing list: [giantswarm](https://groups.google.com/forum/!forum/giantswarm)
- Bugs: [issues](https://github.com/giantswarm/kubernetes-certificate-service/issues)

## Contributing & Reporting Bugs

See [CONTRIBUTING](CONTRIBUTING.md) for details on submitting patches, the contribution workflow as well as reporting bugs.

## License

`kubernetes-certificate-service` is under the Apache 2.0 license. See the [LICENSE](LICENSE) file for details.
