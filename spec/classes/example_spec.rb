require 'spec_helper'

describe 'onepassword' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "onepassword class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('onepassword::params') }
          it { is_expected.to contain_class('onepassword::install').that_comes_before('onepassword::config') }
          it { is_expected.to contain_class('onepassword::config') }
          it { is_expected.to contain_class('onepassword::service').that_subscribes_to('onepassword::config') }

          it { is_expected.to contain_service('onepassword') }
          it { is_expected.to contain_package('onepassword').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'onepassword class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('onepassword') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
