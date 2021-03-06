# Class: perlbrew::params
#
#   This class contains some sane defintions for variables. This class
#   must not be used directly, it gets loaded by the other classes.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class perlbrew::params {

  $perlbrew_root = '/opt/perlbrew'
  $perlbrew_bin  = "$perlbrew::params::perlbrew_root/bin"
  $perlbrew_file = "$perlbrew::params::perlbrew_bin/perlbrew"
  $cpanm_url     = 'http://github.com/miyagawa/cpanminus/raw/master/cpanm'

  # allow the system to choose for us -- less chance of collisions
  $perlbrew_gid = undef
  $perlbrew_uid = undef
}
