module Api
  module Baidu

    def self.get_access_token
      url = "https://aip.baidubce.com/oauth/2.0/token"
      body = {grant_type: 'client_credentials', client_id: "11V1RsldXM5GxBSRx2faS5x0", client_secret: "8vnQX3676s9bR0fvX5klIrhU1thXhqea"}
      resp = ::HTTParty.post(url, body: body)
      resp.parsed_response['access_token']
    end

    def self.ocr_idcard(base64_code_image, side = :front)
      url = "https://aip.baidubce.com/rest/2.0/ocr/v1/idcard"
      body = { access_token: get_access_token, detect_direction: true, id_card_side: side, image: base64_code_image, detect_risk: true }
      resp = ::HTTParty.post(url, body: body, headers: {'Content-Type' => 'application/x-www-form-urlencoded'})
      resp.parsed_response
    end

    def self.ocr_business_license(base64_code_image, detect_direction = false)
      url = "https://aip.baidubce.com/rest/2.0/ocr/v1/business_license"
      body = { access_token: get_access_token, image: base64_code_image, detect_direction: detect_direction }
      resp = ::HTTParty.post(url, body: body, headers: {'Content-Type' => 'application/x-www-form-urlencoded'})
      resp.parsed_response
    end

  end
end
