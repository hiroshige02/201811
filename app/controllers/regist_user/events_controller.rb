class RegistUser::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    # ↑テスト用
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json

  def pulldown
    m = params[:month]
    puts m
    d = Time.mktime(2000, m, 1, 0, 0, 0)
    e = d.end_of_month
    @x = e.day
    binding.pry
    render json: @x
  end

  def create
    @event = Event.new(event_params)
    @event.regist_user_id = current_regist_user.id
    a = params[:a].to_i
    b = params[:b]
    c = params[:c]
    d = params[:d]

    h = Time.now
    j = h.month


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



    x = Time.mktime(i, a, b, c, 0, 0)
    y = Time.mktime(i, a, b, d, 0, 0)

    binding.pry



    if x > h && y > x
  #ここまでで予約時間内での比較は終了。この中で他予約との比較演算を記載。
    if Event.exists?
        #↑ Eventレコードが存在しない時エラーが出るため補正
      event_exists = Event.all
      binding.pry

        event_exists.each do |event_exist|
          if event_exist.start_time.to_date == x.to_date
            puts "bbb"
            #同じ日付の時はこちらに流れるのでここから時間の比較演算を行う
            if event_exist.start_time >= x && event_exist.start_time < y
              puts "kkk"
              flash[:alert] = "予約時間が重複しています"
              render :new and return
              binding.pry
            end

            if event_exist.start_time < x && event_exist.finish_time >= y
              puts "lll"
              flash[:alert] = "予約時間が重複しています"
              render :new and return
              binding.pry
            end

            if event_exist.finish_time > x && event_exist.finish_time <= y
              puts "mmm"
              flash[:alert] = "予約時間が重複しています"
              render :new and return
              binding.pry
            end

            if event_exist.start_time > x && event_exist.finish_time < y
              puts "nnn"
              flash[:alert] = "予約時間が重複しています"
              render :new and return
              binding.pry
            end

          else
            binding.pry
            @event.start_time = x
            @event.finish_time = y
            if @event.save
            redirect_to regist_user_path(current_regist_user.id) and return
            else render:new
            binding.pry
            end
          end
        end #doのend

    else
        #Eventレコードが1つも存在しないときの処理
        binding.pry
        @event.start_time = x
        @event.finish_time = y
        if @event.save
        binding.pry
        redirect_to regist_user_path(current_regist_user.id) and return
        else render:new
        binding.pry
      end
    end

      else
        #時間設定がそもそもおかしい
        flash[:alert] = "設定日時を確認してください"
        render :new and return
      end

   end


  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :content, :admin_ok, :admin_message, :admin_no, :participant, :event_image, :desk)
    end
end