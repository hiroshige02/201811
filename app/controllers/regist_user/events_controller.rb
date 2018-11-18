class RegistUser::EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    # ↑テスト用
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    k = @event.desk
    instance_variable_set('@desk' + k.to_s, true)
  end

  # POST /events
  # POST /events.json

  def pulldown
    m = params[:month]
    puts m
    d = Time.mktime(2000, m, 1, 0, 0, 0)
    e = d.end_of_month
    @x = e.day
    render json: @x
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    @event.regist_user_id = current_regist_user.id
    a = params[:a].to_i
    b = params[:b].to_i
    c = params[:c].to_i
    d = params[:d].to_i
    binding.pry
    h = Time.now
    j = h.month

    @event.month = a
    @event.day = b

      # binding.pry
    if j == 11 || j == 12
      if a == 1 || a == 2
        i = h.year + 1
      else
        i = h.year
      end
    else
      i = h.year
    end
    binding.pry
    @event.year = i
    x = Time.mktime(i, a, b, c, 0, 0)
    y = Time.mktime(i, a, b, d, 0, 0)
    #9時間ずれるため補正

    if x > h && y > x
      binding.pry
  #ここまでで予約時間内での比較は終了。

      if Event.count == 0
        binding.pry
        #↑ Eventレコードが存在しない時エラーが出るため補正
        #Event.allが空の場合。普通にデータ作れる
        if @event.desk == 1..7
          g = @event.desk
          h = g
          binding.pry
        elsif @event.desk == 8
          binding.pry
          g = 1
          h = 2
          binding.pry
        end
          @event.start_time = x
          @event.finish_time = y
          @event.save
        for o in g..h
          binding.pry
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
          binding.pry
          g = @event.desk
          binding.pry
          h = g
        elsif @event.desk == 8
          binding.pry
          g = 1
          h = 2
        end

        if event_exists.exists?
          binding.pry


          event_exists.each do |event_exist|
          binding.pry
            # if event_exist.start_time.to_date == x.to_date
            # 同じ日付の時はこちらに流れるのでここから時間の比較演算を行う
            # まず子テーブルのテーブル番号が重複していないか調べる


            event_exist.desk_numbers.each do |desk_number|
              for o in g..h
                binding.pry
                if desk_number.desk_number == o
                binding.pry
                #日付も同じ、机番号も同じであるならば時間比較を行いなさい
                  if desk_number.start >= x && desk_number.start < y
                    binding.pry
                    flash[:alert] = "予約時間が重複しています"
                    render :new and return
                  end

                  if desk_number.start < x && desk_number.finish >= y
                    puts "lll"
                    flash[:alert] = "予約時間が重複しています"
                    render :new and return
                    binding.pry
                  end

                  if desk_number.finish > x && desk_number.finish <= y
                    puts "mmm"
                    flash[:alert] = "予約時間が重複しています"
                    render :new and return
                    binding.pry
                  end

                  if desk_number.start > x && desk_number.finish < y
                    puts "nnn"
                    flash[:alert] = "予約時間が重複しています"
                    render :new and return
                    binding.pry
                  end
                else
                #日付は同じでも机番号が異なる場合。
                end
              end #forのend

            end  #each desk_number

          end #event_exists.each do |event_exist|のend
            @event.start_time = x
            @event.finish_time = y
            @event.save
            for o in g..h
            binding.pry
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            @desk_number.save
            end
            redirect_to regist_user_path(current_regist_user.id) and return



        else #event_exists.exists?で、同じ日付のデータが無い場合
          @event.start_time = x
          @event.finish_time = y
          @event.save
          binding.pry
          for o in g..h
          binding.pry
          @desk_number = DeskNumber.new
          @desk_number.start = x
          @desk_number.finish = y
          @desk_number.event_id  = @event.id
          @desk_number.desk_number = o
          @desk_number.save
          binding.pry
          end
          redirect_to regist_user_path(current_regist_user.id) and return
        end
      end

    else
      binding.pry
      #時間設定がそもそもおかしい
      flash[:alert] = "設定日時を確認してください"
      render :new and return
    end

  end


  def update
    binding.pry
    @event = Event.find(params[:id])
    @event.regist_user_id = current_regist_user.id
    a = params[:a].to_i
    b = params[:b].to_i
    c = params[:c].to_i
    d = params[:d].to_i
    binding.pry
    h = Time.now
    j = h.month
    dd = params[:c][:d]
    # @event.month = a
    # @event.day = b

      # binding.pry
    if j == 11 || j == 12
      if a == 1 || a == 2
        i = h.year + 1
      else
        i = h.year
      end
    else
      i = h.year
    end
    binding.pry
    # @event.year = i
    x = Time.mktime(i, a, b, c + 9, 0, 0)
    y = Time.mktime(i, a, b, d + 9, 0, 0)


    if x > h && y > x
      binding.pry
  #ここまでで予約時間内での比較は終了。

      event_exists = Event.where(year: i, month: a, day: b)

      if dd.in?(1..7)
        binding.pry
        g = dd
        binding.pry
        h = g
      elsif dd == 8
        binding.pry
        g = 1
        h = 2
      end

      if event_exists.exists?
        event_exists.each do |event_exist|
        binding.pry
            # if event_exist.start_time.to_date == x.to_date
            # 同じ日付の時はこちらに流れるのでここから時間の比較演算を行う
            # まず子テーブルのテーブル番号が重複していないか調べる


          event_exist.desk_numbers.each do |desk_number|
            for o in g..h
              binding.pry
              if desk_number.desk_number == o
              binding.pry
              #日付も同じ、机番号も同じであるならば時間比較を行いなさい
                if desk_number.start >= x && desk_number.start < y
                   binding.pry
                   flash[:alert] = "予約時間が重複しています"
                   render :new and return
                end

                if desk_number.start < x && desk_number.finish >= y
                  puts "lll"
                  flash[:alert] = "予約時間が重複しています"
                  render :new and return
                  binding.pry
                end

                if desk_number.finish > x && desk_number.finish <= y
                  puts "mmm"
                  flash[:alert] = "予約時間が重複しています"
                  render :new and return
                  binding.pry
                end

                if desk_number.start > x && desk_number.finish < y
                  puts "nnn"
                  flash[:alert] = "予約時間が重複しています"
                  render :new and return
                  binding.pry
                end
              else
                #日付は同じでも机番号が異なる場合。
              end
            end #forのend

          end  #each desk_number

        end #event_exists.each do |event_exist|のend
            @event.start_time = x
            @event.finish_time = x
            @event.save
            for o in g..h
            binding.pry
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            @desk_number.save
            end
            redirect_to regist_user_path(current_regist_user.id) and return



      else #event_exists.exists?で、同じ日付のデータが無い場合
        @event.update(event_params)

        if dd != @event.desk
          #別にdestroyしなくてもいいが単数デスク➡︎複数デスク またその逆の時が面倒
          @event.desk_numbers.destroy
          for o in g..h
            binding.pry
            @desk_number = DeskNumber.new
            @desk_number.start = x
            @desk_number.finish = y
            @desk_number.event_id  = @event.id
            @desk_number.desk_number = o
            @desk_number.save
            @event.update(start_time: x, finish_time: y, desk: dd)
          end
        else
          binding.pry
          @event.desk_numbers.each do |desk_number|
            desk_number.update(start: x, finish: y)
          end
          @event.update(start_time: x, finish_time: y)
          binding.pry
        end
        redirect_to regist_user_path(current_regist_user.id) and return
      end




    else
      binding.pry
      #時間設定がそもそもおかしい
      flash[:alert] = "設定日時を確認してください"
      render :new and return
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :content, :admin_ok, :admin_message, :admin_no, :participant, :event_image, :desk)
    end
end