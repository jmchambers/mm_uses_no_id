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
  
  def initialize_copy(other)
    @_new       = true
    @_destroyed = false
    
    begin
      remove_instance_variable(:@_id)
      remove_instance_variable(:@_id_before_type_cast)
    rescue
    end

    associations.each do |name, association|
      instance_variable_set(association.ivar, nil)
    end
    self.attributes = other.attributes.clone.except(:_id).inject({}) do |hash, entry|
      key, value = entry
      hash[key] = value.duplicable? ? value.clone : value
      hash
    end
  end
  
end
