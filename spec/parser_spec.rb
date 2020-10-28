require 'rspec'

RSpec.describe 'parser' do
  it "is executable" do
    expect { system %(./lib/parser.rb) }
      .to output(a_string_including("it works!"))
      .to_stdout_from_any_process
  end
end