require "mm_uses_no_id/version"
require 'active_support/concern'

module MmUsesNoId
  extend ActiveSupport::Concern

  included do
    @keys.delete('_id')

  end

  module ClassMethods

  end

  def eql?(other)
    other.is_a?(self.class) && other.attributes == attributes
  end
  alias :== :eql?
  
end
