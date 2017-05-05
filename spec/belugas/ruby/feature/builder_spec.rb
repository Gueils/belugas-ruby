require "spec_helper"

describe Belugas::Ruby::Feature::Builder do
  context "returns the proper hash format" do
    before {
      @requirement = double("requirement")
      allow(@requirement).to receive(:name).and_return("fake")
      allow(@requirement).to receive(:standard_name).and_return("fake")
      allow(@requirement).to receive(:version).and_return(0.0)
      allow(@requirement).to receive(:categories).and_return(["Category"])
    }

    subject { Belugas::Ruby::Feature::Builder.new(@requirement) }

    it "has all attributes" do
      expect(subject.attributes["type"]).to eq("feature")
      expect(subject.attributes["name"]).to eq("fake")
      expect(subject.attributes["version"]).to eq(0.0)
      expect(subject.attributes["description"]).to eq("The application uses fake")
      expect(subject.attributes["categories"]).to eq(["Category"])
      expect(subject.attributes["cue_locations"]).to eq([""])
    end
  end

  context "for a database category" do
    before {
      @requirement = double("requirement")
      allow(@requirement).to receive(:name).and_return("pg")
      allow(@requirement).to receive(:standard_name).and_return("postgresql")
      allow(@requirement).to receive(:version).and_return(0.0)
      allow(@requirement).to receive(:categories).and_return(["Database"])
    }

    subject { Belugas::Ruby::Feature::Builder.new(@requirement) }

    it "has version 9.6" do
      expect(subject.attributes["type"]).to eq("feature")
      expect(subject.attributes["name"]).to eq("pg")
      expect(subject.attributes["version"]).to eq(9.6)
      expect(subject.attributes["description"]).to eq("The application uses postgresql")
      expect(subject.attributes["categories"]).to eq(["Database"])
      expect(subject.attributes["cue_locations"]).to eq([""])
    end
  end
end
