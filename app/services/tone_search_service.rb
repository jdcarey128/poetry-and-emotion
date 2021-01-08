class ToneSearchService 

  def self.get_tones(text)
    conn = get_ibm_connection 
    response = conn.get('') do |req|
      req.params['text'] = text
      req.params['sentences'] = false 
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_ibm_connection
    Faraday.new('https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/0fa647e2-c660-474c-85db-7bceeeb90e8c/v3/tone') do |conn|
      conn.params['version'] = '2017-09-21'
      conn.basic_auth(ENV['IBM_USERNAME'], ENV['IBM_PASSWORD'])
    end 
  end
end
