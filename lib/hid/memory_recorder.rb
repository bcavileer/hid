module HID
  module MemoryRecorder
    class << self
      attr_accessor :store

      def record(unknown, type)
        type_array = store[type] ||= []

        unless type_array.include? unknown
          type_array << unknown
        end

        nil
      end

      def recorded(type=nil)
        if type
          store[type] || []
        else
          store
        end
      end
    end

    @store = Hash.new
  end
end
