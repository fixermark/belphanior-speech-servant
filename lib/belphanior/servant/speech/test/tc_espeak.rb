require 'rubygems'
require 'belphanior/servant/speech/espeak.rb'
require 'test/unit'
require 'mocha'

# Test of espeak marshaller.

class TestEspeak < Test::Unit::TestCase
  def setup
    @syscall_mock = mock()
    @adaptor = Belphanior::Servant::Speech::Adaptors::Espeak.new(@syscall_mock)
  end

  def test_text
    @syscall_mock.expects(:system).with('espeak "Hello, world!"').returns(true)
    assert_nil(@adaptor.say("Hello, world!"))
  end

  def test_text_with_voice
    @syscall_mock.expects(:system).with('espeak -v "Fred" "Test Message"').returns(true)
    assert_nil(@adaptor.say("Test Message", :voice=>"Fred"))
  end

  def test_error_handling
    @syscall_mock.expects(:system).with('espeak "this will crash"').returns(false)
    @syscall_mock.expects(:system).with('espeak "nil return"').returns(nil)
    assert_raise(Belphanior::Servant::Speech::Adaptors::Espeak::Exception) {
      @adaptor.say("this will crash")
    }
    assert_raise(Belphanior::Servant::Speech::Adaptors::Espeak::Exception) {
      @adaptor.say("nil return")
    }
  end
end
