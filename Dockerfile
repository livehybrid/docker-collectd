FROM ruby:2.2.2

RUN apt-get update -y && apt-get install -y \
	collectd \
	python-pip

RUN \
	pip install envtpl

ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl
ADD collectd.d /etc/collectd/collectd.d

CMD for template in /etc/collectd/collectd.conf.tpl /etc/collectd/collectd.d/*.tpl ; do envtpl $template ; done && exec collectd -f
