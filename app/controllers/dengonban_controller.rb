class DengonbanController < ApplicationController
	layout 'dengonban'

　
	def initialize
		super
		begin
			@dengon_data = JSON.parse(File.read("data.txt")) #rubyオブジェクトへ変換
		rescue
			@dengon_data = Hash.new #空のhashインスタンス
		end
		@dengon_data.each do |key,obj|
			if Time.now.to_i - key.to_i > 24*60*60 then
				@dengon_data.delete(key) #keyに該当データを削除
			end
		end
		File.write("data.txt", @dengon_data.to_json) #削除したデータをjsonに変換後、書き込み（更新）
	end


	def index
		if request.post? then #post有無
			obj = MyData.new(msg:params['msg'], name:params['name'], 
				mail:params['mail']) #postからMyData作成(ひとつにまとめたい)
			@dengon_data[Time.now.to_i] = obj #key(Time.now.to_i)、value(obj)
			data = @dengon_data.to_json #jsonに変換
			File.write("data.txt", data) #jsonでdata.txtへ書き込み
			@dengon_data = JSON.parse(data) #26で「jsonに変換」をrubyオブジェクトへ戻す
		end
	end


end


class MyData
	attr_accessor :name
	attr_accessor :mail
	attr_accessor :msg


	def initialize msg:msg, name:name, mail:mail
		self.name = name
		self.mail = mail
		self.msg = msg
	end


end
