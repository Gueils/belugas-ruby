require "spec_helper"

describe Belugas::Ruby::StandardNames do
  it "has a NAMES defined" do
    expect(Belugas::Ruby::StandardNames::NAMES).not_to be nil
  end
end
