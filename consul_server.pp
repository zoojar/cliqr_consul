class { '::consul':
  pretty_config => true,
    config_hash   => {
      datacenter          => 'datacenter',
      server              => true,
      data_dir            => '/opt/consul',
      client_addr         => '0.0.0.0',
      ui_dir              => '/opt/consul-ui',
      node_name           => $::fqdn,
      log_level           => 'DEBUG',
      advertise_addr      => $::ipaddress_eth1,
      encrypt             => $::consul_encrypt, 
      bootstrap_expect    => 3,
      disable_remote_exec => true,
      retry_join          => split($::consul_member_ips, ','),
    }
}