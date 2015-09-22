#
# Cookbook Name:: ntpd
# rspec unit test :: default.rb
#

require 'spec_helper'

describe 'ntpd::default' do
  let :chef_run do
    ChefSpec::Runner.new(platform: 'centos', version: '7.0').converge described_recipe
  end

    it 'installs the ntp package' do
      expect(chef_run).to install_yum_package('ntp')
    end
end
