module Meditations
  class Engine < ::Rails::Engine
    initializer "meditations" do |app|
      config.assets.precompile += %w(meditations/*.png)
    end
  end
end
