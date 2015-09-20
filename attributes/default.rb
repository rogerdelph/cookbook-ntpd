

# LOGGING OPTIONS
# ------------------------------------------------------------------------

# Drift log file tracks the drift of your system clock
default['ntp']['drift_log_enabled'] = true
default['ntp']['drift_log_location'] = '/var/lib/ntp/ntp.drift'

# To seperate out the ntp log file from the default syslog set the
# attributes below
default['ntp']['log_enabled'] = true
default['ntp']['log_location'] = '/var/lib/ntp/ntp.log'

# ACCESS CONTROLS
# ------------------------------------------------------------------------
# The following attributes will toggle various items for the 'restrict'
# configs

# Prevents free access to the server
default['ntp']['ac_default'] = true

# Deny packets of all kind
default['ntp']['ac_ignore'] = false

# When an access violation occurs a kiss-o'-death (KoD) packet is sent.
default['ntp']['ac_kod'] = true

# Deny service if the packet spacing violate the lower limites in the
# discard command
default['ntp']['ac_limited'] = false
default['ntp']['ac_discard_avg'] = 5
default['ntp']['ac_discard_min'] = 2

# Deny ntpq and ntpdc queries which attempt to modify the state of the
# server.
default['ntp']['ac_nomodify'] = true

# Deny packets that would create a new association
default['ntp']['nopeer'] = true

# Deny ntpq and ntpdc queries
default['ntp']['ac_noquery'] = true

# Deny all packets except from ntpq and ntpdc
default['ntp']['ac_noserve'] = false

# Decline to provide message trap services for remote logging
default['ntp']['ac_notrap'] = true

# Deny service unless the packet is cryptographically authenticated
default['ntp']['ac_notrust'] = false

# Deny packets that do not match the current NTP version
default['ntp']['ac_version'] = false

# Restrict access to loopback addresses only
default['ntp']['ac_loopback_only'] = true

# MODES
# ------------------------------------------------------------------------
# There are multiple ways to configure how ntp will sync time, please
# ensure that only one option is enabled

# Server mode creates persistant association with the specified server.
# The local clock can be synced to the remote clock
default['ntp']['mode_server_enabled'] = true

# Pool mode creates persistant association with mulitple remote servers.
# The local clock can be synced to the remote clock
default['ntp']['mode_pool_enabled'] = false

# Peer Mode creates a symmetric-active association
# Local and Remote clocks can be sycned to each other
default['ntp']['mode_peer_enabled'] = false

# What Servers do you want to use for the modes above
# NOTE: If you prefer one of the servers enter prefer after the address.
default['ntp']['mode_servers'] = [
  '0.pool.ntp.org',
  '1.pool.ntp.org',
  '2.pool.ntp.org',
  '3.pool.ntp.org'
]

# burst will send eight packets instead of one when the server is
# reachable
default['ntp']['mode_burst'] = false

# iburst will send eight packets instead of one when the server is not
# reachable
default['ntp']['mode_iburst'] = true

# UNDISCIPLINED CLOCK
# ------------------------------------------------------------------------

# Enables the use of the local undisciplined clock
default['ntp']['use_cmos'] = false
