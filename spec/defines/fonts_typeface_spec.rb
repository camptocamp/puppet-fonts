require 'spec_helper'

describe 'fonts::typeface' do
  let(:title) { 'myfont.ttf' }
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

        it do should contain_file('/usr/local/share/fonts/myfont.ttf').with(
          'ensure' => 'present',
          'source' => '/dev/null'
        ) end
      end

      describe 'ensuring absent' do
        let(:params) { {
          :ensure => 'absent',
          :source => '/dev/null',
        } }

        it { should contain_file('/usr/local/share/fonts/myfont.ttf').with_ensure('absent') }
      end

      describe 'missing source' do
        let(:params) { {
          :ensure => 'present',
        } }

        it do
          expect {
            should contain_file('/usr/local/share/fonts/myfont.ttf')
          }.to raise_error(Puppet::Error, /Must pass source to Fonts::Typeface\[myfont\.ttf\]/)
        end
      end
    end
  end
end
