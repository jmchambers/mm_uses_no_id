require "mm_uses_no_id/version"
require 'active_support/concern'

module MmUsesNoId
  extend ActiveSupport::Concern

  included do
    @keys.delete('_id')

  end

  module ClassMethods

  end


end
