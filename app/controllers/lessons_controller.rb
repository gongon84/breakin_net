class LessonsController < ApplicationController
  def index
    @areas = [
      ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県"],
      ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"],
      ["新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県"],
      ["三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県"],
      ["鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県"],
      ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"],
    ]

    @lesson = Lesson.all.order(created_at: :desc)
    @area0 = @lesson.where(pref: ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県"]).size
    @area1 = @lesson.where(pref: ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]).size
    @area2 = @lesson.where(pref: ["新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県"]).size
    @area3 = @lesson.where(pref: ["三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県"]).size
    @area4 = @lesson.where(pref: ["鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県"]).size
    @area5 = @lesson.where(pref: ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]).size
  end

  def table
    @pref = params[:pref]
    if params[:serch_place]
      @lesson = Lesson.where('place LIKE ?', "%#{params[:serch_place]}%").page(params[:page]).per(5).order(updated_at: :desc)
    else
      @lesson = Lesson.all.page(params[:page]).per(5).order(updated_at: :desc)
    end
  end

  def show
    @pref = params[:pref]
    @place = params[:place]
    @lesson = Lesson.find_by(pref: @pref, place: @place)
    @user = User.find_by(id: @lesson.user_id)
    # @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @pref = params[:pref]
  end

  def create
    @pref = params[:pref]
    @lesson = Lesson.new(user_id: current_user.id, pref: params[:pref], place: params[:place], station: params[:station], 
      time: params[:time], price: params[:price], profile: params[:profile], url: params[:url])
    if @lesson.save
      redirect_to("/lessons/#{@pref}", notice: "#{@lesson.place}を登録しました")
    else
      render("lessons/new")
    end
  end

  def edit
    @lesson = Lesson.find_by(pref: params[:pref], place: params[:place])
  end

  def update
    @lesson = Lesson.find_by(pref: params[:pref], place: params[:place])
    @lesson.place = params[:new_place]
    @lesson.station = params[:new_station]
    @lesson.time = params[:new_time]
    @lesson.price = params[:new_price]
    @lesson.profile = params[:new_profile]
    @lesson.url = params[:new_url]
    if @lesson.save
      redirect_to("/lessons/#{@lesson.pref}/#{@lesson.place}")
    else
      render("/lessons/edit")
    end
  end

  def destroy
    @lesson = Lesson.find_by(pref: params[:pref], place: params[:place])
    @lesson.destroy
    redirect_to("/lessons/#{params[:pref]}")
  end
end
