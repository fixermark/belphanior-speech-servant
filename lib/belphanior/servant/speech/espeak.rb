# espeak adaptor: Converts speech commands to espeak shell calls 

module Belphanior
  module Servant
    module Speech
      module Adaptors
        class Espeak
          class Exception < RuntimeError
          end
          def initialize(syscall=nil)
            @syscall = syscall
            if not @syscall
              @syscall=Kernel
            end
          end

          def say(message, speech_properties={})
            args=""
            if speech_properties.has_key?(:voice)
              args += "-v \"#{speech_properties[:voice]}\" "
            end
            command_line = "espeak #{args}\"#{message}\""
            result = @syscall.system(command_line)
            if not result
              raise Exception,
              "Error in say: Tried to shell '#{command_line}', but "
              "result was '#{result}'"
            end
          end
        end
      end
    end
  end
end
