require 'rspec'

RSpec.describe 'parser' do
  context "when a valid file is passed as an argument" do
    it "is executable" do
      expect { system %(bin/parser.rb log/webserver.log) }
        .to output
        .to_stdout_from_any_process
    end

    it "runs without error" do
      expect { system %(bin/parser.rb log/webserver.log) }
        .not_to output
        .to_stderr_from_any_process
    end
  end

  context "when no argument is passed" do
    it "errors" do
      expect { system %(bin/parser.rb) }
        .to output
        .to_stderr_from_any_process
    end
  end
end