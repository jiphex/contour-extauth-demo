# Contour Authz Demos

This is a set of demo Kustomize resources to show how Contour's external authz/authn can be used.

Usage:

- (Use a throwaway K8S cluster for this, e.g with k3d or kind or minikube)
- Run 'make install'
- Wait...
- Profit

This will set up a bunch of services, all proxied via the `contour-envoy` LoadBalancer
service in the contour-system namespace. This serves HTTP on port 8081 and HTTPS (with
self-signed certs) on port 8443.

The services are as follows:

- Contour and Envoy (controlled by Contour) in the `contour-system` namespace. These are
  your traditional HTTP/S Ingress, served via Contour. Making normal HTTPProxy and
  standard K8S Ingresses should just work.
- A very simple demo of Kuard running with a HTTPProxy instance is available in the
  default namespace, available as https://basic.localhost
- The extauth-demo namespace has a kuard service running behind the Contour demo
  HTPasswd authz service, available as https://htpasswd.localhost
- The echo namespace has some echo service, but authz is controlled by OPA with a
  statically defined policy from a .rego file. Available as https://opa.localhost
