require 'rspec'
require_relative '../lib/webpages_list'

RSpec.describe WebpagesList do
  describe "#sort_highest_page_views" do
    let(:contents) { %w[Bar Foo Baz Baz Foo] }
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