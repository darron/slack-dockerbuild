from octohost/base:trusty
maintainer darron froese "<darron@froese.org>"
run apt-get update && apt-get install -y ca-certificates; \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
add slack-dockerbuild /usr/local/bin/slack-dockerbuild
add run.sh /usr/local/bin/run
expose 8080
cmd ["/usr/local/bin/run"]
