require 'spec_helper'

describe 'fonts' do
  OSES.each do |os|
    describe "When on #{os}" do
      let(:facts) { {
        :operatingsystem => os,
      } }

      it { should contain_exec('fc-cache').with_refreshonly('true') }
    end
  end
end
