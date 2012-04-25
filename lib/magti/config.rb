# -*- encoding : utf-8 -*-
require 'singleton'

module Magti
  # URL for sending SMS.
  SMS_SEND_URL  = 'http://81.95.160.47/mt/sendsms'

  # URL for tracking SMS status.
  SMS_TRACK_URL = 'http://81.95.160.47/bi/track.php'

  # Service configuration class.
  #
  # Access it, using <code>Magti.config</code>.
  class Config
    include Singleton

    # user name
    attr_accessor :username
    # password
    attr_accessor :password
    # client
    attr_accessor :client
    # service
    attr_accessor :service

    def initialize
      self.service = 1
    end

    # Returns security options hash.
    def security_options
      { :username => self.username, :password => self.password, :client_id => self.client, :service_id => self.service }
    end
  end

  def self.config(params = {})
    params.each do |k, v|
      Magti::Config.instance.send "#{k}=".to_sym, v
    end
    Magti::Config.instance
  end
end
