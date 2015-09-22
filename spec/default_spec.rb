#
# Cookbook Name:: ntpd
# rspec unit test :: default.rb
#

require 'spec_helper'

describe 'ntpd::default' do

  describe 'ntp::default' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge('ntp::default') }

    it 'installs the ntp package' do
      expect(chef_run).to install_package('ntp')
    end
  end
  
end
