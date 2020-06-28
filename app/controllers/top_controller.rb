class TopController < ApplicationController
  def index
  end
  def profile
    @user_name = "レイルズ"
    @gender = "man"
    @birthday = "1987/6/10"
    date_format = "%Y%m%d"
    birthday = @birthday.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    @hometown = "愛知県"
    @skills = ["Ruby on Rails", "詩の朗読", "ものまね"]
    @remarks = "よろしくお願いします！"
  end
end
