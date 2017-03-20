require "spec_helper"

describe Belugas::Ruby::Feature::Handler do
  before {
    @data = [{
               "name" => "sinatra",
               "version" => "1.2",
               "category" => ["Framework"]
             }]
  }

  subject { Belugas::Ruby::Feature::Handler.new(@data) }

  it "transcodes" do
    expect(subject.transcode).to have_key("sinatra")
  end

  it "encodes" do
    expect(subject.encode.first).to have_key("version")
  end
end
