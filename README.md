# Mattermost Docker Preview Image

This is a single-machine Docker image for previewing the latest release of Mattermost.

To contribute, please see [Contribution Guidelines](https://docs.mattermost.com/developer/contribution-guide.html).

To file issues, [search for existing bugs and file a GitHub issue if your bug is new](https://www.mattermost.org/filing-issues/).

## Usage

Please see [documentation for usage](http://docs.mattermost.com/install/docker-local-machine.html). 

If you have Docker already set up, you can run this image in one line: 

```
docker run --name mattermost-preview -d --publish 8065:8065 mattermost/mattermost-preview
```
