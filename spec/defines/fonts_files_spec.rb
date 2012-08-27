require 'spec_helper'

describe 'fonts::files' do
  let(:title) { 'myfontfamily' }
  let(:params) { {
    :source => '/dev/random',
  } }

  OSES.each do |os|
    describe "When on #{os}" do
      let(:facts) { {
        :operatingsystem => os,
      } }

      it { should include_class('fonts') }

      describe 'ensuring present with default path' do
        let(:params) { {
          :ensure => 'present',
          :source => '/dev/null'
        } }

        it do should contain_file('/usr/local/share/fonts/myfontfamily').with(
          'ensure'  => 'directory',
          'source'  => '/dev/null',
          'recurse' => true
        ) end
      end

      describe 'ensuring absent' do
        let(:params) { {
          :ensure => 'absent',
        } }

        it { should contain_file('/usr/local/share/fonts/myfontfamily').with_ensure('absent') }
      end

      describe 'missing source' do
        let(:params) { {
          :ensure => 'present',
        } }

        it do
          expect {
            should contain_file('/usr/local/share/fonts/myfontfamily')
          }.to raise_error(Puppet::Error, /Must pass source to Fonts::Files\[myfontfamily\]/)
        end
      end
    end
  end
end
