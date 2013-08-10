# Class: perlbrew::install
#
#   This class will install the perlbrew script itself and uses the package
#   manager of the operating system to install the required compiler
#   toolchain. The compiler toolchain is required to compile the Perl
#   interpreter later.
#
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class perlbrew::install {
  if ! defined(Package['autoconf'])  { package { 'autoconf':  ensure => installed } }
  if ! defined(Package['automake'])  { package { 'automake':  ensure => installed } }
  if ! defined(Package['binutils'])  { package { 'binutils':  ensure => installed } }
  if ! defined(Package['bison'])     { package { 'bison':     ensure => installed } }
  if ! defined(Package['flex'])      { package { 'flex':      ensure => installed } }
  if ! defined(Package['gcc'])       { package { 'gcc':       ensure => installed } }
  if ! defined(Package['gcc-c++'])   { package { 'gcc-c++':   ensure => installed } }
  if ! defined(Package['gettext'])   { package { 'gettext':   ensure => installed } }
  if ! defined(Package['libtool'])   { package { 'libtool':   ensure => installed } }
  if ! defined(Package['make'])      { package { 'make':      ensure => installed } }
  if ! defined(Package['patch'])     { package { 'patch':     ensure => installed } }
  if ! defined(Package['pkgconfig']) { package { 'pkgconfig': ensure => installed } }

  # Other packages required to build a proper Perl 
  if ! defined(Package['readline-devel']) { package { 'readline-devel': ensure => installed } }
  if ! defined(Package['openssl-devel'])  { package { 'openssl-devel':  ensure => installed } }
  if ! defined(Package['zlib-devel'])     { package { 'zlib-devel':     ensure => installed } }
  if ! defined(Package['wget'])           { package { 'wget':           ensure => installed } }

  file {
    $perlbrew::params::perlbrew_file:
      owner   => root,
      group   => root,
      mode    => '0755',
      source  => "puppet:///modules/${module_name}/perlbrew",
      require => [
        Package['wget'],
        Package['autoconf'],
        Package['automake'],
        Package['binutils'],
        Package['bison'],
        Package['flex'],
        Package['gcc'],
        Package['gcc-c++'],
        Package['gettext'],
        Package['libtool'],
        Package['make'],
        Package['patch'],
        Package['pkgconfig'],
        Package['readline-devel'],
        Package['openssl-devel'],
        Package['zlib-devel'],
      ],
    }
}
