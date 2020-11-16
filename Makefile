KUBECTL ?= kubectl

kustomize:
	$(KUBECTL) kustomize .

diff:
	$(KUBECTL) diff -k .

install:
	$(KUBECTL) apply -k .
