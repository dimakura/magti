# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Sending SMS' do
  before(:all) do
    Magti.config({:username => 'dimitri', :password => 'secret', :service => 1, :client => 1})
    @resp = Magti.send_sms '595335514', 'test'
  end
  subject { @resp }
  its(:code) { should == '0000' }
  its(:id) { should > 0 }
end