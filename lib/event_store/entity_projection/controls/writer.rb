module EventStore
  module EntityProjection
    module Controls
      module Writer
        def self.write_batch(stream_name=nil)
          stream_name = Controls::StreamName.get stream_name

          writer = EventStore::Messaging::Writer.build

          write_first(stream_name, writer)
          write_second(stream_name, writer)

          stream_name
        end

        def self.write_first(stream_name, writer=nil)
          message = Controls::Message.some_message

          write message, stream_name, writer

          stream_name
        end

        def self.write_second(stream_name, writer=nil)
          message = Controls::Message.other_message

          write message, stream_name, writer

          stream_name
        end

        def self.write(message, stream_name, writer=nil)
          writer ||= EventStore::Messaging::Writer.build

          writer.write message, stream_name
        end
      end
    end
  end
end
