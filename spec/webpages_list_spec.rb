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

  describe "sort_unique_page_views" do
    let(:contents) { [] }
    subject { WebpagesList.new(contents).sort_unique_page_views }

    context "when there are 4 unique URLs" do
      context "from 4 unique users" do
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
    end

    context "when there are 4 page views for a URL" do
      context "from 3 unique users" do
        let(:contents) { [
          'Bar 139.204.200.167',
          'Bar 248.133.146.13',
          'Bar 248.133.146.13',
          'Bar 244.48.38.123',
        ] }

        it "only returns unique URLs" do
          expect(subject.count).to eq 1
        end

        it "returns the number of unique views" do
          expect(subject).to eq [["Bar", 3]]
        end
      end
    end

    context "when 2 URLs are visited by 3 unique users" do
      let(:ip1) { '244.48.38.123' }
      let(:ip2) { '248.133.146.13' }
      let(:ip3) { '139.204.200.167' }
      let(:contents) { [
        "Foo #{ip1}",
        "Bar #{ip2}",
        "Foo #{ip2}",
        "Foo #{ip2}",
        "Bar #{ip1}",
        "Bar #{ip3}",
        "Bar #{ip1}",
        "Foo #{ip1}",
      ] }

      it "returns the URLs ordered by unique views, then alphabetical" do
        expect(subject).to eq [
          ["Bar", 3],
          ["Foo", 2],
        ]
      end
    end
  end
end