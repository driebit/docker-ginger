driebit/ginger
==============

Alpine-based Docker images that run [Ginger](https://github.com/driebit/ginger).
This includes

* [Zotonic](https://github.com/zotonic/zotonic)
* a `zotonic.config` with the dependencies that Ginger requires and config
  parameters for them
* an `erlang.config` with a Lager Logstash handler.

dev image
---------

### Options

The image is preconfigured with a Lager Logstash handler. Configure the handler
with the `LOGSTASH_HOST` and `LOGSTASH_PORT` environment variables.

prod image
----------
