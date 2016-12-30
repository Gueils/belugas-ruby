module Belugas
  module Ruby
    class RemoteDependency
      attr_reader :name, :standard_name
      def initialize(name, standard_name)
        @name = name
        @standard_name = standard_name
      end

      def version; end
    end
  end
end
