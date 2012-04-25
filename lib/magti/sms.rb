# -*- encoding : utf-8 -*-
require 'set'
require 'cgi'
require 'httparty'

module Magti
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
    raise ArgumentError, 'illegal mobile number' unless C12.correct_mobile?(mobile)
    raise ArgumentError, 'max size exceeded' if text.length > Magti::MAX_SIZE
    options = Magti.config.security_options
    if options.nil? or options.empty? or !Set.new(options.keys).proper_subset?(Set[:username, :password, :client_id, :service_id])
      raise ArgumentError, 'specify Magti.config(options) with :username, :password, :client and :service keys'
    end
    options = options.merge(:to => "995#{mobile}", :text => text)
    resp = HTTParty.get(Magti::SMS_SEND_URL, options)
    resp = Response.new
    resp.code, resp.id = resp.split(' - ')
    resp
  end

end
