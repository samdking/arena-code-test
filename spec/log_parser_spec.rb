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
        expect(subject.import.count).to eq 5
      end
    end
  end

  describe "#sort_highest_page_views" do
    subject { LogParser.new(file) }

    let(:file) { './spec/fixtures/file.log' }

    it "runs" do
      expect { subject.sort_highest_page_views }.not_to raise_error
    end

    it "only returns unique rows" do
      expect(subject.sort_highest_page_views.count).to eq 3
    end

    it "returns the highest occuring value first, and its page views" do
      expect(subject.sort_highest_page_views.first).to eq ['Baz', 2]
    end

    it "sorts alphabetically after page view" do
      expect(subject.sort_highest_page_views[0..1]).to eq [
        ['Baz', 2],
        ['Foo', 2]
      ]
    end
  end
end