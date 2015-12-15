actions :create
default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :mode, kind_of: String, default: 'http'
attribute :balance_type, kind_of: String, default: 'roundrobin'
attribute :backend_options, kind_of: Array, default: []
attribute :servers, kind_of: Array, default: []

attr_accessor :exists
