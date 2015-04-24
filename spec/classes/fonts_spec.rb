require 'spec_helper'

describe 'fonts' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { should contain_exec('fc-cache').with_refreshonly('true') }
    end
  end
end
