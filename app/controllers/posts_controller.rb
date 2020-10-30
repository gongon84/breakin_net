class PostsController < ApplicationController
  def index
    @areas = [
      ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県"],
      ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"],
      ["新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県"],
      ["三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県"],
      ["鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県"],
      ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"],
    ]

    @post = Post.all.order(created_at: :desc)
  end

  def table
    @pref = params[:pref]
    if params[:serch_place]
      @post = Post.where('place LIKE ?', "%#{params[:serch_place]}%").page(params[:page]).per(5).order(updated_at: :desc)
    else
      @post = Post.all.page(params[:page]).per(5).order(updated_at: :desc)
    end
    # @post = Post.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @pref = params[:pref]
    @place = params[:place]
    @post = Post.find_by(pref: @pref, place: @place)
    @comments = User.all.order(created_at: :desc)
  end

  def new
    @pref = params[:pref]
  end

  def create
    @pref = params[:pref]
    @post = Post.new(pref: params[:pref], place: params[:place], station: params[:station], 
      facility: params[:facility], time: params[:time], price: params[:price], tag: params[:tag], image_name: "NoImage.jpg")
    if @post.save
      redirect_to("/posts/#{@pref}", notice: "#{@post.place}を登録しました")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(pref: params[:pref], place: params[:place])
  end

  def update
    @post = Post.find_by(pref: params[:pref], place: params[:place])
    @post.place = params[:new_place]
    @post.station = params[:new_station]
    @post.facility = params[:new_facility]
    @post.time = params[:new_time]
    @post.price = params[:new_price]
    @post.tag = params[:new_tag]
    @post.memo = params[:new_memo]
    if params[:new_image_name]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:new_image_name]
      File.binwrite("public/posts_images/#{@post.image_name}", image.read)
    else
      @post.image_name = "NoImage.jpg"
    end
    if @post.save
      redirect_to("/posts/#{@post.pref}/#{@post.place}")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @comments = User.where(pref: params[:pref], place: params[:place])
    @post = Post.find_by(pref: params[:pref], place: params[:place])
    @post.destroy
    redirect_to("/posts/#{params[:pref]}")
  end

  def editImage
    @post = Post.find_by(pref: params[:pref], place: params[:place])
  end

  def updateImage
    @post = Post.find_by(pref: params[:pref], place: params[:place])
    if params[:new_image_name]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:new_image_name]
      File.binwrite("public/posts_images/#{@post.image_name}", image.read)
    end
    if @post.save
      redirect_to("/posts/#{@post.pref}/#{@post.place}")
    else
      render("/posts/edit")
    end
  end

  def defaultImage
    @post = Post.find_by(pref: params[:pref], place: params[:place])
    @post.image_name = "NoImage.jpg"
    if @post.save
      redirect_to("/posts/#{@post.pref}/#{@post.place}")
    else
      render("/posts/edit")
    end
  end
end