require 'rspec'

RSpec.describe 'parser' do
  it "is executable" do
    expect { system %(./parser.rb log/webserver.log) }
      .to output
      .to_stdout_from_any_process
  end

  it "runs without error" do
    expect { system %(./parser.rb log/webserver.log) }
      .not_to output
      .to_stderr_from_any_process
  end
end