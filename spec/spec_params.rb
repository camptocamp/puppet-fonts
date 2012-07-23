module SpecParams
end

OSES = ['Debian', 'RedHat', 'Ubuntu', 'CentOS']

require 'puppet'
PUPPETVERSION = Puppet::PUPPETVERSION.to_s

VARS = {
  'Debian'                 => {
  },

  'RedHat' => {
  },
}
VARS['Ubuntu'] = VARS['Debian']
VARS['CentOS'] = VARS['RedHat']

