.PHONY: docker-test fmt lint test vet

FILES := $(shell find . -name '*.go')

default: test

docker-test:
	docker run --rm \
		-e CGO_ENABLED=0 \
		-v $(PWD):/go-hostpool \
		-w /go-hostpool \
		golang:1.11.4 make 

test:
	go test -v

fmt:
	go fmt $(FILES)

lint:
	gofmt -d $(FILES)

vet:
	go vet 
