USERNAME := mavelli
REPO     := rocker-bayesian
VERSION  := v$(shell date +%Y%m%d)
TAG      := $(USERNAME)/$(REPO):$(VERSION)
LATEST   := $(USERNAME)/$(REPO):latest

.PHONY: all update build tag-latest push check-tag check-login clean clean-all

all: update

update: build tag-latest push
	@echo "Done:"
	@echo "   - $(TAG)"
	@echo "   - $(LATEST)"

check-tag:
	@if docker images --format "{{.Repository}}:{{.Tag}}" | grep -q "^$(TAG)$$"; then \
		echo "Tag $(TAG) already exists locally. Remove it with 'make clean' "; \
		exit 1; \
	fi

build: check-tag
	docker build -t $(TAG) . || { echo "Docker build failed."; exit 1; }

tag-latest: build
	docker tag $(TAG) $(LATEST) || { echo "Failed to tag as latest."; exit 1; }

push: 
	docker push $(TAG) || { echo "Failed to push $(TAG)."; exit 1; }
	docker push $(LATEST) || { echo "Failed to push $(LATEST)."; exit 1; }

clean:
	docker rmi $(TAG) 2>/dev/null || true
	
clean-all: clean
	docker rmi $(LATEST) 2>/dev/null || true
