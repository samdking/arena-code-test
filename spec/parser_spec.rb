require 'rspec'

RSpec.describe 'parser' do
  context "when a valid file is passed as an argument" do
    it "is executable" do
      expect { system %(bin/parser.rb spec/fixtures/file.log) }
        .to output
        .to_stdout_from_any_process
    end

    it "runs without error" do
      expect { system %(bin/parser.rb spec/fixtures/file.log) }
        .not_to output
        .to_stderr_from_any_process
    end

    it "uses the correct pluralisation" do
      expect { system %(bin/parser.rb spec/fixtures/file.log) }
        .not_to output(/1 (unique )?visits/)
        .to_stdout_from_any_process
    end
  end

  context "when no argument is passed" do
    it "errors" do
      expect { system %(bin/parser.rb) }
        .to output
        .to_stderr_from_any_process
    end
  end

  context "when an invalid argument is passed" do
    it "errors" do
      expect { system %(bin/parser.rb /does/not/exist) }
        .to output
        .to_stderr_from_any_process
    end
  end
end