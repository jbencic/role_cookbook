# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'Apache Test'

control 'apache-1.0' do             # A unique ID for this control
  impact 1.0                        # The criticality, if this control fails.
  title 'Check Apache port'         # A human-readable title
  desc 'An optional description...'
  describe port(80) do
  it { should be_listening }
  its('processes') {should include 'httpd'}
end

end
