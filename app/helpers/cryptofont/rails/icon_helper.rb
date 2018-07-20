module Cryptofont
  module Rails
    module IconHelper
      # Examples
      #
      #   cf_icon "btc"
      #   # => <i class="cf-btc"></i>
      #
      #   cf_icon "ltc", text: "Litecoin"
      #   # => <i class="cf-litecoin"></i> Litecoin
      #
      #   cf_icon "eth", text: "Ethereum", right: true
      #   # => Ethereum <i class="cf-eth"></i>
      #
      #   cf_icon "dash 4x", text: "Dash"
      #   # => <i class="cf-dash cf-4x"></i>
      #
      def cf_icon(names = 'flag', options = {})
        classes = []
        classes.concat Private.icon_names(names)
        classes.concat Array(options.delete(:class))
        text = options.delete(:text)
        right_icon = options.delete(:right)
        icon = content_tag(:i, nil, options.merge(class: classes))
        Private.icon_join(icon, text, right_icon)
      end

      module Private
        extend ActionView::Helpers::OutputSafetyHelper

        def self.icon_join(icon, text, reverse_order = false)
          return icon if text.blank?
          elements = [icon, ERB::Util.html_escape(text)]
          elements.reverse! if reverse_order
          safe_join(elements, ' ')
        end

        def self.icon_names(names = [])
          array_value(names).map { |n| "cf-#{n}" }
        end

        def self.array_value(value = [])
          value.is_a?(Array) ? value : value.to_s.split(/\s+/)
        end
      end
    end
  end
end
