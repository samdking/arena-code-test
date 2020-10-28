require 'rspec'
require_relative '../lib/webpages_list'

RSpec.describe WebpagesList do
  describe "#sort_highest_page_views" do
    let(:contents) { [
      'Bar 139.204.200.167',
      'Foo 248.133.146.13',
      'Baz 198.27.104.9',
      'Baz 111.243.41.65',
      'Foo 244.48.38.123'
    ] }
    subject { WebpagesList.new(contents) }

    it "runs" do
      expect { subject.sort_highest_page_views }.not_to raise_error
    end

    it "only returns unique rows" do
      expect(subject.sort_highest_page_views.count).to eq 3
    end

    it "returns the highest occuring value first, and its page views" do
      expect(subject.sort_highest_page_views.first).to eq ['Baz', 2]
    end

    it "sorts alphabetically for matching page view" do
      expect(subject.sort_highest_page_views[0..1]).to eq [
        ['Baz', 2],
        ['Foo', 2]
      ]
    end
  end
end