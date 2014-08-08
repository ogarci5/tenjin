require 'httparty'
require 'httmultiparty'
require 'net/http'
require 'net/https'

class MediaClient
  include HTTMultiParty
  # "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US"
  base_uri 'https://www.google.com/speech-api/v1/recognize'
end

response = MediaClient.post('/', :query => {
  xjerr: 1,
  client: 'chromium',
  lang: 'en-US',
  Content: File.new('Reading 1.mp3'),
  verify: false
})

p response

curl -X POST -d "Content=@Reading%201.mp3;Content-Type=audio/mpeg" https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US

PHTProblem.new(pht_test_tempalate: pht_test_template)

problem = pht_test_template.problems.build(params[:pht_problem])

problem.save

curl -X POST \
--data-binary @audio/Reading\ 1_00m_00s__00m_05s.mp3 \
--header 'Content-Type: audio/mpeg; rate=16000;' \
'https://www.google.com/speech-api/v1/recognize?output=json&xjerr=1&client=chromium&lang=en-US'

curl -X POST \
--data-binary @audio/Reading\ 1_00m_00s__00m_05s.flac \
--header 'Content-Type: audio/x-flac; rate=41000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&xjerr=1&client=chromium&lang=en-US&key=AIzaSyB3H9xx98A7jniLcYyXJz7JgNBLp52ltqI'

wget -q -U "Mozilla/5.0" --post-file Reading\ 1_00m_00s__00m_05s.flac --header "Content-Type: audio/x-flac; rate=44100" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&key=AIzaSyCnl6MRydhw_5fLXIdASxkLJzcJh5iX0M4" | cut -d\" -f12 >stt.txt
wget -q -U "Mozilla/5.0" --post-file Reading\ 1_00m_00s__00m_05s.flac --header "Content-Type: audio/x-flac; rate=8000" -O - "http://www.google.com/speech-api/v1/recognize?lang=ja&client=chromium" | cut -d\" -f12 > stt.txt
=begin
require 'net/http'
require 'net/https'
require 'uri'
url = "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US"
uri = URI.parse(url)
data = File.read('Reading 1.mp3')  #File.read("/usr/test.amr")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
request = Net::HTTP::Post.new(uri.request_uri)
request.body = data
request.content_type = 'audio/mp3'
res = http.request(request)
p res.body
=end