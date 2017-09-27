FROM ruby:2.2.2

RUN apt-get update -y && apt-get install -y \
	collectd \
	python-pip

ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl

