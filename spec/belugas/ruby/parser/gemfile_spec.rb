require "spec_helper"

describe Belugas::Ruby::Parser::Gemfile do
  subject { Belugas::Ruby::Parser::Gemfile.new("spec/support/Gemfile") }

  it "has a bunch of dependencies" do
    expect(subject.dependencies).not_to be_empty
  end

  context "an empty Gemfile" do
    it "has nothing" do
      empty_gemfile_subject = Belugas::Ruby::Parser::Gemfile.new("spec/support/empty_Gemfile")
      expect(empty_gemfile_subject.dependencies).to be_empty
    end
  end

  it "has_a ruby version" do
    empty_gemfile_subject = Belugas::Ruby::Parser::Gemfile.new("spec/support/Gemfile")
    expect(empty_gemfile_subject.ruby_version).to eq("2.3.1")
  end

  it "has_no ruby version" do
    empty_gemfile_subject = Belugas::Ruby::Parser::Gemfile.new("spec/support/no_ruby_Gemfile")
    expect(empty_gemfile_subject.ruby_version).to eq("2.4.0")
  end
end
