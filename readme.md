# Dockerbuild

Notifies Slack when a Docker Trusted Build is complete.

This is a fork of the [original](https://github.com/ehazlett/slack-dockerbuild) - I just added a Dockerfile that took care of compilation and adjusted the README.

## Build
```
git clone https://github.com/darron/slack-dockerbuild.git
cd slack-dockerbuild
docker build -t {your-name-here}/slack-dockerbuild .
```

If you don't want to build it yourself, you can always use `docker pull darron/slack-dockerbuild`

## Run

1. Add an "Incoming Webhook Integration" in Slack. Once you've got the URL you can start the container.

2. `docker run -p 8080:8080 --restart=always -e URL=https://hooks.slack.com/services/custom/url/here -d darron/slack-dockerbuild /usr/local/bin/run`

3. Once that's running, then add a webhook for this service in the Docker Hub:

  `https://domain.name.goes.here:8080/notify`

  in the Docker Trusted Build:

  ![](http://shared.froese.org/2015/s0e28-17-21.jpg)

4. If it's all setup correctly, you should see your builds complete inside of Slack.

  ![](http://shared.froese.org/2015/uxsbs-17-24.jpg)

## Usage

Listens on port 8080.

To run outside of a Docker container - like a barbarian:

```
./slack-dockerbuild -url <slack-incoming-webhook-url> -channel <slack-channel>
```
