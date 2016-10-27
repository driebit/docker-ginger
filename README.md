driebit/ginger
==============

Alpine-based Docker images that run [Ginger](https://github.com/driebit/ginger):

* a [dev image](https://hub.docker.com/r/driebit/ginger-dev/)
* a [prod image](https://hub.docker.com/r/driebit/ginger/)

Both images are available on [Docker Hub](https://hub.docker.com/r/driebit).

The images include:

* [Zotonic](https://github.com/zotonic/zotonic)
* a `zotonic.config` with the dependencies that Ginger requires and config
  parameters for them
* an `erlang.config` with a Lager Logstash handler.


Runtime configuration
---------------------

The image is preconfigured with a Lager Logstash handler. Configure the handler
with the `LOGSTASH_HOST` and `LOGSTASH_PORT` environment variables.
