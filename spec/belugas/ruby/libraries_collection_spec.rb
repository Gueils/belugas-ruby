require "spec_helper"

describe Belugas::Ruby::LibrariesCollection do
  before {
    @dependencies = []

    sinatra_requirement = double("requirement")
    allow(sinatra_requirement).to receive(:requirements).and_return(["=>2.3"])
    sinatra_bundler_dependency = double("bundler_dependency")
    allow(sinatra_bundler_dependency).to receive(:name).and_return("sinatra")
    allow(sinatra_bundler_dependency).to receive(:requirement).and_return(sinatra_requirement)
    sinatra = Belugas::Ruby::Dependency.new(sinatra_bundler_dependency)

    pg_requirement = double("requirement")
    allow(pg_requirement).to receive(:requirements).and_return(["=>1.5"])
    pg_bundler_dependency = double("bundler_dependency")
    allow(pg_bundler_dependency).to receive(:name).and_return("pg")
    allow(pg_bundler_dependency).to receive(:requirement).and_return(pg_requirement)
    pg = Belugas::Ruby::Dependency.new(pg_bundler_dependency)

    @dependencies << sinatra
    @dependencies << pg
  }

  subject { Belugas::Ruby::LibrariesCollection.new(@dependencies) }

  it "has dependecies with standard names" do
    expect(subject.dependencies.count).to eq(2)
    expect(subject.dependencies.first.standard_name).to eq("sinatra")
    expect(subject.dependencies.last.standard_name).to eq("postgresql")
  end
end
