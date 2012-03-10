class LittleSMS
  class << self
    attr_accessor :use_ssl
  end
  # Use ssl by default
  self.use_ssl = true

  def initialize(api_user, api_key, sender = 'LittleSMS', cert_file = nil, &block)
    @api_user, @api_key, @sender, @cert_file = api_user, api_key, sender, cert_file
    @components = {}
    self.instance_eval &block if block_given?
  end

  def method_missing(name, *args)
    @components[name] ||= Component.new(name, @api_user, @api_key, @sender, @cert_file)
  end
end

