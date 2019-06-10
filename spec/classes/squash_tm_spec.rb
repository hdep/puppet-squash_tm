require 'spec_helper'

describe 'squash_tm' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_service('squash-tm').with_ensure('running') }
      it { is_expected.to contain_package('squash-tm').with_ensure('held').that_requires('Package[openjdk-8-jdk]') }
      it { is_expected.to contain_package('openjdk-8-jdk').with_ensure('present') }
      it { is_expected.to contain_file('/etc/default/squash-tm').with('ensure' => 'present', 'owner' => 'root', 'group' => 'root', 'mode' => '0600') }
    end
  end
end
