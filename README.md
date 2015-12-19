ntpd
====
[![Cookbook Version](https://img.shields.io/cookbook/v/ntpd.svg)](https://supermarket.chef.io/cookbooks/ntpd)
[![Build Status](https://travis-ci.org/rogerdelph/cookbook-ntpd.svg?branch=master)](https://travis-ci.org/rogerdelph/cookbook-ntpd)
[![Dependencies](http://img.shields.io/gemnasium/rogerdelph/cookbook-ntpd.svg)](https://gemnasium.com/rogerdelph/cookbook-ntpd)

This cookbook installs and configures the ntpd service to syncronize the clock against network servers.  The configuration can be change to also configure the system as a peer for other computers to syncronize their clocks. 

Requirements
------------

Chef 0.10.10+ and Ohai 6.10+ for `platform_family` use.

## Platforms:

The following platforms and versions are tested and supported using [test-kitchen](http://kitchen.ci/)

* CentOS 6.7, 7.0

The following platform families are supported and are assumed to work based on successful testing.

* Red Hat (rhel)
* Amazon Linux


Attributes
----------
Please review `attributes/default.rb` for default values, and all attributed contain comments in the field for easier use. 

#### Logging Options
The following attributes change if logging is enabled and where the logs are stored.

* `node['ntp']['drift_log_enabled']` - To log the drift of your system clock into a log file, defaults to `true`
* `node['ntp']['drift_log_location']` - The location of the drift log if enabled, defaults to `/var/lib/ntp/ntp.drift`
* `node['ntp']['log_enabled']` - To seperate out the ntp log from the default syslog provider, defaults to `true`
* `node['ntp']['log_location']` - The location of the log if enabled, defaults to `/var/lib/ntp/ntp.log`

#### Access Controls
The following attributes change how the server responds how the server responds to requests.

* `node['ntp']['ac_default']` - Prevents the free access to the server, defaults `true`
* `node['ntp']['ac_ignore']` - Prevents any packet accessing the ntp server, defaults `false`
* `node['ntp']['ac_kod']` - Enables the sending of the 'kiss-o'death' (KoD) packet when access violations occur, defaults to `true`
* `node['ntp']['ac_limited']` - Denys service if the packet spacing violates the lower limits in the discard command, defaults to `false`
* `node['ntp']['ac_discard_avg']` - Sets the minimum average packet spacing if the limited facility is enabled, defaults to `5`
* `node['ntp']['ac_discard_min']` - Sets the minimum packet spacing if the limited facility is enabled, defaults to `2`
* `node['ntp']['ac_nomodify']` - Deny ntpq and ntpdc queries which attempt to modify the state of the server, defaults to `true`
* `node['ntp']['nopeer']` - Deny packets that would attempt to create new peer associations, defaults to `true`
* `node['ntp']['ac_noquery']` - Deny ntpq and ntpdc queries, defaults to `true`
* `node['ntp']['ac_noserve']` - Deny all packets except from ntpq and ntpdc, defaults to `false`
* `node['ntp']['ac_notrap']` - Decline to provide message trap services for remote logging, defaults to `true`
* `node['ntp']['ac_notrust']` - Deny service unless the packet is cryptographically authenticated, defaults to `false`
* `node['ntp']['ac_version']` - Deny packets that do not match the current NTP version, defaults to `false`
* `node['ntp']['ac_loopback_only']` - Restrict access to loopback addresses only, defaults to `true`

#### Server Modes
The following attributes determine how and where the ntpd service syncronizes the clock.

* `node['ntp']['mode_server_enabled']` - Server mode creates persistant association with the servers specified in the `node['ntp']['mode_servers']` attribute, defaults to `true`
* `node['ntp']['mode_pool_enabled']` - Pool mode creates persistant association with mulitple remote servers specified in the `node['ntp']['mode_servers']` attribute.  The local clock can be synced to the remote clock, defaults to `false`
* `node['ntp']['mode_peer_enabled']` - Peer Mode creates a symmetric-active association Local and Remote clocks can be sycned to each other, defaults to `false`
* `node['ntp']['mode_servers']` - Is an array of what servers to associate the ntpd service with. It is possible to enter `prefered` after a server to make it the preferred server.  The entries default to the general ntp.org servers, `['0.pool.ntp.org','1.pool.ntp.org','2.pool.ntp.org','3.pool.ntp.org']`
* `node['ntp']['mode_burst']` - Burst will send eight packets instead of one when teh server is reachable, defaults to `false`
* `node['ntp']['mode_iburst']` - iBurst will send eight packets instead of one when the server is not reachable, defaults to `true`

#### Undisciplined Clock
The following enables the use of the system undisciplined clock if all other network associations are unavailable.

* `node['ntp']['use_cmos']` - Enables the use of the undiscplined system clock, defaults to `false`


License and Authors
-------------------
* Author:: Roger Delph (<roger.delph@gmail.com>)

Copyright 2015, Roger Delph

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
