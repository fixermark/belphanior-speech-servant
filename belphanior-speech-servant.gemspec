Gem::Specification.new do |s|
  s.name = %q{belphanior-speech-servant}
  s.version = "0.0.1"
  s.date = %q{2011-7-31}
  s.authors = ["Mark T. Tomczak"]
  s.email = %q{iam+belphanior-speech-servant@fixermark.com}
  s.summary = %q{The Belphanior Speech Servant allows for the output of synthesized speech from an audio-equipped device. Utilizes the 'espeak' command-line tool to generate audio output.}
  s.description =  %q{See the documentation for more information. Documentation page coming soon.}
  s.add_dependency("belphanior-servant", ">= 0.0.1")
  s.files = [ "belphanior-speech-servant.gemspec",
              "lib/belphanior/servant/speech/espeak_marshaller.rb" ]
  s.test_files = Dir.glob('lib/belphanior/servant/speech/test/tc_*.rb')
end
