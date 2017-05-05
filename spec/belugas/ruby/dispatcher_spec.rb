require "spec_helper"

describe Belugas::Ruby::Dispatcher do
  subject { Belugas::Ruby::Dispatcher.new("spec/support/Gemfile") }

  context "has valid categories" do
    it "renders proper database features" do
      expect(subject.render).to eq([{ "type" => "feature",
                                      "name" => "Ruby",
                                      "version" => "2.3.1",
                                      "description" => "The application uses Ruby code",
                                      "categories" => ["Language"],
                                      "engines" => ["belugas", "belugas-ruby"] },
                                    { "type" => "feature",
                                      "name" => "rails",
                                      "version" => "4.2.6",
                                      "description" => "The application uses rails",
                                      "content" => "",
                                      "categories" => ["Framework"],
                                      "cue_locations" => [""],
                                      "engines" => ["belugas", "belugas-ruby"] },
                                    { "type" => "feature",
                                      "name" => "postgresql",
                                      "version" => "9.6",
                                      "description" => "The application uses postgresql",
                                      "content" => "",
                                      "categories" => ["Database"],
                                      "cue_locations" => [""],
                                      "engines" => ["belugas", "belugas-ruby"] },
                                    { "type" => "feature",
                                      "name" => "sidekiq",
                                      "version" => "0",
                                      "description" => "The application uses sidekiq",
                                      "content" => "",
                                      "categories" => ["Service"],
                                      "cue_locations" => [""],
                                      "engines" => ["belugas", "belugas-ruby"] },
                                    { "type" => "feature",
                                      "name" => "sidekiq",
                                      "version" => "0",
                                      "description" => "The application uses sidekiq",
                                      "content" => "",
                                      "categories" => ["Service"],
                                      "cue_locations" => [""],
                                      "engines" => ["belugas", "belugas-ruby"] },
                                    { "type" => "feature",
                                      "name" => "rmagick",
                                      "version" => "0",
                                      "description" => "The application uses rmagick",
                                      "content" => "",
                                      "categories" => ["Library"],
                                      "cue_locations" => [""],
                                      "engines" => ["belugas", "belugas-ruby"] }])
    end
  end

  context "has empty categories" do
    it "for a known requirement" do
      missing_framework_subject = Belugas::Ruby::Dispatcher.new("spec/support/empty_Gemfile")
      expect(missing_framework_subject.render).to eq([{ "type" => "feature",
                                                        "name" => "Ruby",
                                                        "version" => "2.4.0",
                                                        "description" => "The application uses Ruby code",
                                                        "categories" => ["Language"],
                                                        "engines" => ["belugas", "belugas-ruby"] }])
    end
  end

  context "without postgres version" do
    it "return version 9.6" do
      no_postgres_version_subject = Belugas::Ruby::Dispatcher.new("spec/support/no_postgres_Gemfile")
      expect(no_postgres_version_subject.render).to eq([{ "type" => "feature",
                                                          "name" => "Ruby",
                                                          "version" => "2.3.1",
                                                          "description" => "The application uses Ruby code",
                                                          "categories" => ["Language"],
                                                          "engines" => ["belugas", "belugas-ruby"] },
                                                        { "type" => "feature",
                                                          "name" => "rails",
                                                          "version" => "4.2.6",
                                                          "description" => "The application uses rails",
                                                          "content" => "",
                                                          "categories" => ["Framework"],
                                                          "cue_locations" => [""],
                                                          "engines" => ["belugas", "belugas-ruby"] },
                                                        { "type" => "feature",
                                                          "name" => "postgresql",
                                                          "version" => "9.6",
                                                          "description" => "The application uses postgresql",
                                                          "content" => "",
                                                          "categories" => ["Database"],
                                                          "cue_locations" => [""],
                                                          "engines" => ["belugas", "belugas-ruby"] },
                                                        { "type" => "feature",
                                                          "name" => "sidekiq",
                                                          "version" => "0",
                                                          "description" => "The application uses sidekiq",
                                                          "content" => "",
                                                          "categories" => ["Service"],
                                                          "cue_locations" => [""],
                                                          "engines" => ["belugas", "belugas-ruby"] },
                                                        { "type" => "feature",
                                                          "name" => "sidekiq",
                                                          "version" => "0",
                                                          "description" => "The application uses sidekiq",
                                                          "content" => "",
                                                          "categories" => ["Service"],
                                                          "cue_locations" => [""],
                                                          "engines" => ["belugas", "belugas-ruby"] },
                                                        { "type" => "feature",
                                                          "name" => "rmagick",
                                                          "version" => "0",
                                                          "description" => "The application uses rmagick",
                                                          "content" => "",
                                                          "categories" => ["Library"],
                                                          "cue_locations" => [""],
                                                          "engines" => ["belugas", "belugas-ruby"] }])
    end
  end
end
