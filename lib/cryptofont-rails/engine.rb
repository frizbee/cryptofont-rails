#require "cryptofont/rails/version"

module Cryptofont
  module Rails
    class Engine < ::Rails::Engine
      config.assets.precompile << %w( cryptofont-webfont.eot  cryptofont-webfont.svg  cryptofont-webfont.ttf  cryptofont-webfont.woff )
    end
  end
end
