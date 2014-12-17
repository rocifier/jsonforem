require 'textacular'
ActiveRecord::Base.extend(Textacular)

module Jsonforem

  class Engine < ::Rails::Engine
    isolate_namespace Jsonforem

  end
end
