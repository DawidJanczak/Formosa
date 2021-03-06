require "spec_helper"

describe "Static pages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector("title", text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:page_title) { "" }

    it_should_behave_like "all static pages"
  end
end
