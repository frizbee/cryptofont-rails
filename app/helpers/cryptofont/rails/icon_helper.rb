module Cryptofont
  module Rails
    module IconHelper
      # Creates an icon tag given an icon name and possible icon
      # modifiers.
      #
      # Examples
      #
      #   cf_icon "btc"
      #   # => <i class="cf-btc"></i>
      #
      #   cf_icon "btc", text: "Bitcoin"
      #   # => <i class="cf-btc"></i> Bitcoin
      #
      #   cf_icon "btc-right", text: "Bitcoin", right: true
      #   # => Bitcoin <i class="cf-btc-right"></i>
      #
      #   cf_icon "btc", data: { id: 123 }
      #   # => <i class="cf-btc" data-id="123"></i>
      #
      #   content_tag(:li, cf_icon("ltc li", text: "Bulleted list item"))
      #   # => <li><i class="cf-ltc fa-li"></i> Bulleted list item</li>
      def ion_icon(names = 'flag', options = {})
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
