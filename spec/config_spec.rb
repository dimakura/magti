# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Test config' do
  before(:all) do
    Magti.config.username = 'dimitri'
    Magti.config.password = 'secret'
    Magti.config.client   = 10
    Magti.config.service  = 100
  end
  context 'options for sending SMS' do
    subject { Magti.config.security_options }
    it { should be_instance_of Hash }
    specify { subject[:username].should == 'dimitri' }
    specify { subject[:password].should == 'secret' }
    specify { subject[:client_id].should == 10 }
    specify { subject[:service_id].should == 100 }
  end
end

describe 'Test config assignment using hash' do
  before(:all) do
    Magti.config({:username => 'dk', :password => 'password', :client => 99, :service => 66})
  end
  context 'options for sending SMS' do
    subject { Magti.config.security_options }
    it { should be_instance_of Hash }
    specify { subject[:username].should == 'dk' }
    specify { subject[:password].should == 'password' }
    specify { subject[:client_id].should == 99 }
    specify { subject[:service_id].should == 66 }
  end
end
