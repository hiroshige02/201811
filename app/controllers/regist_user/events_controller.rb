class RegistUser::EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  before_action :authenticate_regist_user!

  def index
    @events = Event.all
  end

  def show
    if Event.find(params[:id]).regist_user_id != current_regist_user.id
      redirect_to regist_user_path(current_regist_user.id)
    else
      @event = Event.find(params[:id])
    end
  end

  def new
    @event = Event.new
  end

  def edit
    if Event.find(params[:id]).regist_user_id != current_regist_user.id
      redirect_to regist_user_path(current_regist_user.id)
    else
      @event = Event.find(params[:id])
      k = @event.desk
      instance_variable_set('@desk' + k.to_s, true)
    end
  end

  def no_image
    @event = Event.find(params[:id])
    @event.update(event_image: nil)
    redirect_to edit_regist_user_event_path(@event.id)
  end

  def modal
    m = params[:month].to_i
    d = params[:day].to_i

    h = Time.now
    j = h.month

    if j == 11 || j == 12
      if m == 1 || m == 2
        i = h.year + 1
      else
        i = h.year
      end
    else
      i = h.year
    end

    @events = Event.where(year: i, month: m, day: d, admin_no: false)
    render json: @events
  end


  def pulldown
    m = params[:month]
    d = Time.mktime(2000, m, 1, 0, 0, 0)
    e = d.end_of_month
    @x = e.day
    render json: @x
  end

  def create
    @event = Event.new(event_params)
    if params[:a].blank? || params[:b].blank? || params[:c].blank? || params[:d].blank? || @event.title.blank? || @event.content.blank? || @event.participant.blank? || @event.desk.blank?
      flash.now[:alert] = "入力項目を確認してください"
      render :new and return
    else


      @event.regist_user_id = current_regist_user.id
      a = params[:a].to_i
      b = params[:b].to_i
      c = params[:c].to_i
      d = params[:d].to_i
      h = Time.now
      j = h.month

      @event.month = a
      @event.day = b

      if j == 11 || j == 12
        if a == 1 || a == 2
          i = h.year + 1
        else
          i = h.year
        end
      else
        i = h.year
      end

      @event.year = i
      x = Time.mktime(i, a, b, c, 0, 0)
      y = Time.mktime(i, a, b, d, 0, 0)

      if x > h && y > x  #ここまでで予約時間内での比較は終了。

        if Event.count == 0
          @event.start_time = x
          @event.finish_time = y
          @event.save
          if @event.desk.in?(1..7)
            g = @event.desk
            h = g
          elsif @event.desk == 8
            g = 1
            h = 2
          elsif @event.desk == 9
            g = 6
            h = 7
          end
          @event.start_time = x
          @event.finish_time = y
          @event.save

          for o in g..h
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            @desk_number.save
          end
          redirect_to regist_user_path(current_regist_user.id) and return
        else
          event_exists = Event.where(year: i, month: a, day: b)
          if @event.desk.in?(1..7)
            g = @event.desk
            h = g
          elsif @event.desk == 8
            g = 1
            h = 2
          elsif @event.desk == 9
            g = 6
            h = 7
          end

          if event_exists.exists?
            event_exists.each do |event_exist|
              # if event_exist.start_time.to_date == x.to_date
              # 同じ日付の時はこちらに流れるのでここから時間の比較演算を行う
              # まず子テーブルのテーブル番号が重複していないか調べる
              event_exist.desk_numbers.each do |desk_number|
                for o in g..h
                  if desk_number.desk_number == o
                  #日付も同じ、机番号も同じであるならば時間比較を行いなさい
                    if desk_number.start >= x && desk_number.start < y
                      flash.now[:alert] = "予約時間が重複しています"
                      render :new and return
                    end

                    if desk_number.start < x && desk_number.finish >= y
                      flash.now[:alert] = "予約時間が重複しています"
                      render :new and return
                    end

                    if desk_number.finish > x && desk_number.finish <= y
                      flash.now[:alert] = "予約時間が重複しています"
                      render :new and return
                    end

                    if desk_number.start > x && desk_number.finish < y
                      flash.now[:alert] = "予約時間が重複しています"
                      render :new and return
                    end

                  else
                  #日付は同じでも机番号が異なる場合。
                  end
                end #forのend
              end  #each do desk_number

            end #event_exists.each do |event_exist|のend

            @event.start_time = x
            @event.finish_time = y
            @event.save
            for o in g..h
              @desk_number = DeskNumber.new
              @desk_number.start = x
              @desk_number.finish = y
              @desk_number.event_id  = @event.id
              @desk_number.desk_number = o
              @desk_number.save
            end
            redirect_to regist_user_path(current_regist_user.id) and return

          else #if event_exists.exists?で、同じ日付のデータが無い場合
            @event.start_time = x
            @event.finish_time = y
            @event.save
            for o in g..h
              @desk_number = DeskNumber.new
              @desk_number.start = x
              @desk_number.finish = y
              @desk_number.event_id  = @event.id
              @desk_number.desk_number = o
              @desk_number.save
            end
            redirect_to regist_user_path(current_regist_user.id) and return
          end #if event_exists.exists?のend
        end #if Event.count == 0 のend
      else #時間設定がそもそもおかしい場合
        flash.now[:alert] = "設定日時を確認してください"
        render :new and return
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.regist_user_id = current_regist_user.id
    a = params[:a].to_i
    b = params[:b].to_i
    c = params[:c].to_i
    d = params[:d].to_i
    h = Time.now
    j = h.month
    dd = params[:z][:t].to_i

    if j == 11 || j == 12
      if a == 1 || a == 2
        i = h.year + 1
      else
        i = h.year
      end
    else
      i = h.year
    end

    x = Time.mktime(i, a, b, c, 0, 0)
    y = Time.mktime(i, a, b, d, 0, 0)

    if x > h && y > x
    #ここまでで予約時間内での比較は終了。
      event_exists = Event.where(year: i, month: a, day: b)

      event_exist_stock = []
      event_exists.each do |event_exist|
        if event_exist.id != @event.id
          event_exist_stock << event_exist
        end
      end

      if dd.in?(1..7)
        g = dd
        h = g
      elsif dd == 8
        g = 1
        h = 2
      elsif dd == 9
        g = 6
        h = 7
      end

      unless event_exist_stock.blank?
        event_exist_stock.each do |event_exist|
            # if event_exist.start_time.to_date == x.to_date
            # 同じ日付の時はこちらに流れるのでここから時間の比較演算を行う
            # まず子テーブルのテーブル番号が重複していないか調べる
          event_exist.desk_numbers.each do |desk_number|
            for o in g..h
              if desk_number.desk_number == o
              #日付も同じ、机番号も同じであるならば時間比較を行いなさい
                if desk_number.start >= x && desk_number.start < y
                   flash.now[:alert] = "予約時間が重複しています"
                   render :edit and return
                end

                if desk_number.start < x && desk_number.finish >= y
                  flash.now[:alert] = "予約時間が重複しています"
                  render :edit and return
                end

                if desk_number.finish > x && desk_number.finish <= y
                  flash.now[:alert] = "予約時間が重複しています"
                  render :edit and return
                end

                if desk_number.start > x && desk_number.finish < y
                  flash.now[:alert] = "予約時間が重複しています"
                  render :edit and return
                end
              else
                #日付は同じでも机番号が異なる場合。
              end
            end #forのend
          end  #each desk_numberのend
        end #event_exists.each do |event_exist|のend

        @event.update(event_params)
        @event.update(admin_ok: false, admin_no: false, admin_message: "", start_time: x, finish_time: y, year: i, month: a, day: b )

        if dd != @event.desk
          @event.update(desk: dd)
          kk = DeskNumber.where(event_id: @event.id)
          kk.delete_all
          #別にdestroyしなくてもいいが単数デスク➡︎複数デスク またその逆の時が面倒
          for o in g..h
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            if @desk_number.save
              redirect_to regist_user_path(current_regist_user.id) and return
            else render :edit and return
            end
          end
        else
        #元の@event.deskが今回選択した机と同じだったら
          @event.desk_numbers.each do |desk_number|
            desk_number.update(start: x, finish: y)
          end

          if @event.update(start_time: x, finish_time: y)
            redirect_to regist_user_path(current_regist_user.id) and return
          else render :edit and return
          end
        end

      else #event_exists.exists?で、同じ日付のデータが無い場合
        @event.update(event_params)
        @event.update(admin_ok: false, admin_no: false, admin_message: "", start_time: x, finish_time: y, year: i, month: a, day: b)
        if dd != @event.desk
          @event.update(desk: dd)
          #別にdestroyしなくてもいいが単数デスク➡︎複数デスク またその逆の時が面倒
          kk = DeskNumber.where(event_id: @event.id)
          kk.delete_all
          for o in g..h
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            @desk_number.save
          end
        else
          #元の@event.deskが今回選択した机と同じだったら
          @event.desk_numbers.each do |desk_number|
            desk_number.update(start: x, finish: y)
          end
          @event.update(start_time: x, finish_time: y)
        end
        redirect_to regist_user_path(current_regist_user.id) and return
      end

    else
      #時間設定がそもそもおかしい
      flash[:alert] = "設定日時を確認してください"
      render :edit and return
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to regist_user_path(current_regist_user.id)
  end

  private
  def event_params
    params.require(:event).permit(:title, :content, :admin_ok, :admin_message, :admin_no, :participant, :event_image, :desk)
  end

end