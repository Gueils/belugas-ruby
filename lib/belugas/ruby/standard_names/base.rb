module Belugas
  module Ruby
    module StandardNames
      NAMES = {
        "capybara-webkit" => { "standard_name" => "webkit",
                  "categories" => ["Library"] },
        "sinatra" => { "standard_name" => "sinatra",
                  "categories" => ["Framework"] },
        "middleman" => { "standard_name" => "middleman",
                       "categories" => ["Framework"] },
        "rails" => { "standard_name" => "rails",
                  "categories" => ["Framework"] },
        "pg" => { "standard_name" => "postgresql",
                  "categories" => ["Database"] },
        "sidekiq" => { "standard_name" => "sidekiq",
                       "categories" => ["Service"]},
        "sidekiq-scheduler" => { "standard_name" => "sidekiq",
                                 "categories" => ["Service"] },
        "mini_magick" => { "standard_name" => "rmagick",
                       "categories" => ["Library"] },
        "rmagick" => { "standard_name" => "rmagick",
                       "categories" => ["Library"] },
        "mongoid" => { "standard_name" => "mongodb",
                       "categories" => ["Database"] }
      }
    end
  end
end
