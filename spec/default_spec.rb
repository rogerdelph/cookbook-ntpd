#
# Cookbook Name:: ntpd
# rspec unit test :: default.rb
#

require 'spec_helper'
require 'chefspec'

describe 'ntpd::default' do
  let :chef_run do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge described_recipe
  end

  it 'installs the ntp package' do
    expect(chef_run).to install_yum_package('ntp')
  end

  it 'installs the ntpdate package' do
    expect(chef_run).to install_yum_package('ntpdate')
  end

  it 'starts the ntpd service' do
    expect(chef_run).to start_service('ntpd')
  end

  it 'creates a template with attributes' do
    expect(chef_run).to create_template('/etc/ntp.conf').with(
      owner: 'root',
      group: 'root',
      mode: '0755'
    )
  end
end
