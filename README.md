# kubernetes-certificate-service

[![](https://img.shields.io/docker/pulls/giantswarm/kubernetes-certificate-service.svg)](https://hub.docker.com/r/giantswarm/kubernetes-certificate-service) [![IRC Channel](https://img.shields.io/badge/irc-%23giantswarm-blue.svg)](https://kiwiirc.com/client/irc.freenode.net/#giantswarm)

`kubernetes-certificate-service` generates and provides certificates for TLS encryption.

On start, the service will generate certificates and make them available via HTTP.
These files can be accessed via `/ca.crt`, `/server.crt`, and `/server.key`.

## Getting `kubernetes-certificate-service`

Clone the git repository: https://github.com/giantswarm/kubernetes-certificate-service.git

Download the latest docker image from here: https://hub.docker.com/r/giantswarm/kubernetes-certificate-service/

### How to build

- docker build -t giantswarm/kubernetes-certificate-service .

## Running `kubernetes-certificate-service`

- docker run -p 8000:80 giantswarm/kubernetes-certificate-service $KUBERNETES_MASTER_ADDRESS

Note: You may want to mount `/certs` to durable storage, to avoid losing certificates when the container dies.

## Contact

- Mailing list: [giantswarm](https://groups.google.com/forum/!forum/giantswarm)
- IRC: #[giantswarm](irc://irc.freenode.org:6667/#giantswarm) on freenode.org
- Bugs: [issues](https://github.com/giantswarm/kubernetes-certificate-service/issues)

## Contributing & Reporting Bugs

See [CONTRIBUTING](CONTRIBUTING.md) for details on submitting patches, the contribution workflow as well as reporting bugs.

## License

`kubernetes-certificate-service` is under the Apache 2.0 license. See the [LICENSE](LICENSE) file for details.