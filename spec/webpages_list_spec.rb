require 'rspec'
require_relative '../lib/webpages_list'

RSpec.describe WebpagesList do
  describe "#sort_highest_page_views" do
    let(:contents) { [] }
    subject { WebpagesList.new(contents).sort_highest_page_views }

    context "when there is a single record" do
      let(:contents) { [
        'Bar 139.204.200.167',
      ] }

      it "returns the URL and its page views" do
        expect(subject).to eq [["Bar", 1]]
      end
    end

    context "when there are 4 unique URLs" do
      let(:contents) { [
        'Bar 139.204.200.167',
        'Foo 248.133.146.13',
        'Baz 198.27.104.9',
        'Fiz 244.48.38.123',
      ] }

      it "returns 4 URLs" do
        expect(subject.count).to eq 4
      end

      it "returns them in alphabetical order" do
        expect(subject.first.first).to eq "Bar"
        expect(subject.last.first).to eq "Foo"
      end
    end

    context "when there are duplicate URLs" do
      let(:contents) { [
        'Bar 139.204.200.167',
        'Foo 248.133.146.13',
        'Baz 198.27.104.9',
        'Foo 244.48.38.123',
      ] }

      it "only returns unique URLs" do
        expect(subject.count).to eq 3
      end

      it "returns the URLs in order of occurences" do
        expect(subject).to eq [
          ["Foo", 2],
          ["Bar", 1],
          ["Baz", 1],
        ]
      end
    end
  end
end