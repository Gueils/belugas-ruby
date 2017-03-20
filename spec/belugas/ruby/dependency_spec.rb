require "spec_helper"

describe Belugas::Ruby::Dependency do
  before {
    requirement = double("requirement")
    allow(requirement).to receive(:requirements).and_return(["=>2.3"])
    @bundler_dependency = double("bundler_dependency")
    allow(@bundler_dependency).to receive(:name).and_return("sinatra")
    allow(@bundler_dependency).to receive(:requirement).and_return(requirement)
  }

  subject { Belugas::Ruby::Dependency.new(@bundler_dependency) }

  it "updates its standard_name" do
    expect(subject.update("sinatra")).to eq(subject)
    expect(subject.standard_name).to eq("sinatra")
  end

  it "has a name" do
    expect(subject.name).to eq("sinatra")
  end

  it "has a category named Framework" do
    subject.update("sinatra")
    expect(subject.categories).to eq(["Framework"])
  end

  it "renders a json" do
    expect(subject.to_json).to eq({name: "sinatra", version: "2.3"}.to_json)
  end
end
