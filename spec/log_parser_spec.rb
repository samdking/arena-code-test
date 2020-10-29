require 'rspec'
require_relative '../lib/log_parser'

RSpec.describe LogParser do
  it "can be initialized with a file" do
    LogParser.new('/path/to/file')
  end

  it "raises an error if no file is given" do
    expect { LogParser.new }
      .to raise_error(ArgumentError)
  end

  describe "#import" do
    subject { LogParser.new(file) }

    context "with an invalid file argument" do
      let(:file) { '/file/doesnt/exist' }

      it "can't be imported" do
        expect { subject.import }
          .to raise_error("No such file or directory @ rb_sysopen - #{file}")
      end
    end

    context "with a valid file" do
      let(:file) { './spec/fixtures/file.log' }

      it "runs" do
        expect { subject.import }.not_to raise_error
      end

      it "counts each line" do
        expect(subject.import.count).to eq 7
      end
    end
  end
end