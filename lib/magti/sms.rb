# -*- encoding : utf-8 -*-
require 'set'
require 'cgi'
require 'httparty'

module Magti

  private

  def self.validate_security_options(options)
    if options.nil? or options.empty? or Set[:username, :password, :service_id, :client_id] != Set.new(options.keys)
      raise ArgumentError, 'specify Magti.config(options) with :username, :password, :client and :service keys'
    end
  end

  public

  # Response object.
  # It contains information on response code and message id.
  class Response
    attr_accessor :id
    attr_accessor :code
  end

  # Sending SMS.
  #
  # @param mobile mobile number
  # @param text text to be sent
  # @return Response object with response code and message ID
  def self.send_sms(mobile, text)
    options = Magti.config.security_options
    Magti.validate_security_options(options)
    options = options.merge(:to => "995#{mobile}", :text => text, :coding => 2)
    http_resp = HTTParty.post(Magti::SMS_SEND_URL, {:body => options}).body
    resp = Response.new
    resp.code, resp.id = http_resp.split(' - ')
    resp
  end

  # Tracking SMS.
  def self.track_sms(msg_id)
    options = Magti.config.security_options
    Magti.validate_security_options(options)
    options = options.merge(:message_id => msg_id)
    http_resp = HTTParty.get(Magti::SMS_TRACK_URL, {:query => options}).body
    http_resp.to_i
  end
end
