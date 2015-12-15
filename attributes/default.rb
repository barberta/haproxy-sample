default['haproxy']['version'] = nil

default['haproxy']['conf_dir'] = '/etc/haproxy'
default['haproxy']['conf_file'] = 'haproxy.cfg'

default['haproxy']['global_chroot'] = '/var/lib/haproxy'
default['haproxy']['global_pidfile'] = '/var/run/haproxy.pid'
default['haproxy']['global_maxconn'] = '4000'
default['haproxy']['global_user'] = 'haproxy'
default['haproxy']['global_group'] = 'haproxy'
default['haproxy']['global_daemon'] = true
default['haproxy']['global_stats_path'] = '/var/lib/haproxy/stats'

default['haproxy']['default_mode'] = 'http'
default['haproxy']['default_log'] = 'global'
default['haproxy']['default_options'] = [
  'httplog',
  'dontlognull',
  'http-server-close',
  'forwardfor',
  'redispatch'
]
default['haproxy']['default_retries'] = '3'
default['haproxy']['default_timeout'] = {
  'http-request' => '10s',
  'queue' => '1m',
  'connect' => '10s',
  'client' => '1m',
  'server' => '1m',
  'http-keep-alive' => '10s',
  'check' => '10s'
}
default['haproxy']['default_maxconn'] = '3000'

default['haproxy']['frontends'] = []
default['haproxy']['backends'] = []
