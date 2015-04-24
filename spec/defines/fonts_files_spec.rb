require 'spec_helper'

describe 'fonts::files' do
  let(:title) { 'myfontfamily' }
  let(:params) { {
    :source => '/dev/random',
  } }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('fonts') }

      context 'ensuring present with default path' do
        let(:params) { {
          :ensure => 'present',
          :source => '/dev/null'
        } }

        it do is_expected.to contain_file('/usr/local/share/fonts/myfontfamily').with(
          'ensure'  => 'directory',
          'source'  => '/dev/null',
          'recurse' => true
        ) end
      end

      describe 'ensuring absent' do
        let(:params) { {
          :ensure => 'absent',
        } }

        it { is_expected.to contain_file('/usr/local/share/fonts/myfontfamily').with_ensure('absent') }
      end

      describe 'missing source' do
        let(:params) { {
          :ensure => 'present',
        } }

        it do
          expect {
            is_expected.to contain_file('/usr/local/share/fonts/myfontfamily')
          }.to raise_error(Puppet::Error, /Must pass source to Fonts::Files\[myfontfamily\]/)
        end
      end
    end
  end
end
