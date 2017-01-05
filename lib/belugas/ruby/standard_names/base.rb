module Belugas
  module Ruby
    module StandardNames
      NAMES = {
        "rails" => { "standard_name" => "rails",
                  "categories" => ["Framework"] },
        "pg" => { "standard_name" => "postgresql",
                  "categories" => ["Database"] },
        "sidekiq" => { "standard_name" => "sidekiq",
                       "categories" => ["Service"]},
        "sidekiq-scheduler" => { "standard_name" => "sidekiq",
                                 "categories" => ["Service"] },
        "rmagick" => { "standard_name" => "rmagick",
                       "categories" => ["Library"] },
        "mongoid" => { "standard_name" => "mongodb",
                       "categories" => ["Database"] }
      }
    end
  end
end
