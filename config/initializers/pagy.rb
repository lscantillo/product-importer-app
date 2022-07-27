# frozen_string_literal: true

require 'pagy/extras/bootstrap'
require 'pagy/extras/headers'
require 'pagy/extras/metadata'
require 'pagy/extras/array'

Pagy::DEFAULT[:items] = 5 # items per page
Pagy::DEFAULT[:headers] = { page: 'Current-Page',
                            items: 'Page-Items',
                            count: 'Total-Count',
                            pages: 'Total-Pages' }
# When you are done setting your own default freeze it, so it will not get changed accidentally
Pagy::DEFAULT.freeze
