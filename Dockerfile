FROM octohost/go-1.5.1
MAINTAINER darron froese "<darron@froese.org>"
RUN apt-get update && apt-get install -y git ca-certificates --no-install-recommends; \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /build
ADD . /build
WORKDIR /build
RUN go get -u github.com/gorilla/mux
RUN go build -o slack-dockerbuild
RUN cp -f slack-dockerbuild /usr/local/bin/slack-dockerbuild && chmod 775 /usr/local/bin/slack-dockerbuild
ADD run.sh /usr/local/bin/run
EXPOSE 8080
CMD ["/usr/local/bin/run"]
