# Docker version 1.4.1, build 5bc2ff8
FROM nccts/baseimage:0.0.10

# nccts/clojure
# Version: 0.0.10
MAINTAINER "Michael Bradley" <michael.bradley@nccts.org>
# Salve, Regina, Mater misericordiæ, vita, dulcedo, et spes nostra, salve.

# Cache buster
ENV REFRESHED_AT [2014-10-01 Wed 17:15]

# Set environment variables
ENV HOME /root

# Add supporting files for the build
ADD . /docker-build

# Run main setup script, cleanup supporting files
RUN chmod -R 777 /docker-build && /docker-build/setup.sh && rm -rf /docker-build

# Use phusion/baseimage's init system as the entrypoint:
# 'entry.sh' starts tmux as the 'sailor' user with a session named 'clojure'
ENTRYPOINT ["/sbin/my_init", "--", "/usr/local/bin/entry.sh", "clojure"]
CMD [""]

# example usage
# --------------------------------------------------
# docker run -it --rm nccts/clojure
# docker run -it --rm nccts/clojure lein repl
