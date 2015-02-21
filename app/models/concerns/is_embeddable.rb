module IsEmbeddable
  extend ActiveSupport::Concern

  module ClassMethods
    def create_type_name(name)
      define_method(:create_type_name) do
        name
      end
    end
  end
end
