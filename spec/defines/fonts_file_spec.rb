require 'spec_helper'

describe 'fonts::file' do
  let(:title) { 'myfont.ttf' }
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

      context 'when ensuring present with default path' do
        let(:params) { {
          :ensure => 'present',
          :source => '/dev/null'
        } }

        it { is_expected.to contain_file('/usr/local/share/fonts/myfont.ttf').with({
          'ensure' => 'present',
          'source' => '/dev/null',
        } ) }
      end

      context 'when ensuring absent' do
        let(:params) { {
          :ensure => 'absent',
          :source => '/dev/null',
        } }

        it { should contain_file('/usr/local/share/fonts/myfont.ttf').with_ensure('absent') }
      end

      context 'missing source' do
        let(:params) { {
          :ensure => 'present',
        } }

        it do
          expect {
            should contain_file('/usr/local/share/fonts/myfont.ttf')
          }.to raise_error(Puppet::Error, /Must pass source to Fonts::File\[myfont\.ttf\]/)
        end
      end
    end
  end
end
