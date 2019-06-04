RSpec.configure do |config| 
    config.before(:each) do 
        stub_request(:get, /currencydatafeed.com/ )
        .with( headers: {
            'Accept' => '*/*'
        }).to_return(status: 200, body:
            '{
                "status": true,
                "currency": [
                    {
                        "currency": "USD/BRL",
                        "value": "3.41325",
                        "date": "2019-06-03 15:00:00",
                        "type": "original"
                    }
                ]
            }', headers: {})
    end
end