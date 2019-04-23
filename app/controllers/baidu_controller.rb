class BaiduController < ApplicationController

  def ocr_idcard
    result = {}
    file = params[:file]
    if file.present?
      ocr_result = Api::Baidu.ocr_idcard(Base64.encode64(File.read(file.tempfile)), params[:side])
      if ocr_result['error_msg'].present?
        result = {result: 'failed', msg: ocr_result['error_msg']}
      else
        begin
          data = {}
          if params[:side] == "front"
            data[:address] = ocr_result['words_result']["住址"]["words"].to_s.gsub("无", "")
            data[:birth_on] = ocr_result['words_result']["出生"]["words"].to_s.gsub("无", "").to_date
            data[:name] = ocr_result['words_result']["姓名"]["words"].to_s.gsub("无", "")
            data[:card_no] = ocr_result['words_result']["公民身份号码"]["words"].to_s.gsub("无", "")
            data[:sex] = ocr_result['words_result']["性别"]["words"].to_s.gsub("无", "")
            data[:nation] = ocr_result['words_result']["民族"]["words"].to_s.gsub("无", "")
          else params[:side] == "back"
            data[:issue_on] = ocr_result['words_result']["签发日期"]["words"].to_s.gsub("无", "").to_date
            data[:issue_org] = ocr_result['words_result']["签发机关"]["words"].to_s.gsub("无", "")
            data[:expiry_on] = ocr_result['words_result']["失效日期"]["words"].to_s.gsub("无", "").to_date
          end
          result = {result: 'success', data: data}
        rescue
          result = {result: 'failed', msg: "解析失败"}
        end
      end
    else
      result = {result: 'failed', msg: '文件不存在'}
    end
    render json: result
  end

end
