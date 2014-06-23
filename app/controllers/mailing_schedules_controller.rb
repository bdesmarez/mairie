class MailingSchedulesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_mailing_schedule, only: [:show, :edit, :update, :destroy]

  # GET /mailing_schedules
  # GET /mailing_schedules.json
  def index
    @mailing_schedules = MailingSchedule.all
  end

  # GET /mailing_schedules/1
  # GET /mailing_schedules/1.json
  def show
  end

  # GET /mailing_schedules/new
  def new
    @mailing_schedule = MailingSchedule.new
  end

  # GET /mailing_schedules/1/edit
  def edit
  end

  # POST /mailing_schedules
  # POST /mailing_schedules.json
  def create
    @mailing_schedule = MailingSchedule.new(mailing_schedule_params)

    respond_to do |format|
      if @mailing_schedule.save
        upload_image(@mailing_schedule)
        format.html { redirect_to @mailing_schedule, notice: 'Mailing schedule was successfully created.' }
        format.json { render :show, status: :created, location: @mailing_schedule }
      else
        format.html { render :new }
        format.json { render json: @mailing_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailing_schedules/1
  # PATCH/PUT /mailing_schedules/1.json
  def update
    respond_to do |format|
      if @mailing_schedule.update(mailing_schedule_params)
        upload_image(@mailing_schedule)
        format.html { redirect_to @mailing_schedule, notice: 'Mailing schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailing_schedule }
      else
        format.html { render :edit }
        format.json { render json: @mailing_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailing_schedules/1
  # DELETE /mailing_schedules/1.json
  def destroy
    @mailing_schedule.destroy
    respond_to do |format|
      format.html { redirect_to mailing_schedules_url, notice: 'Mailing schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailing_schedule
      @mailing_schedule = MailingSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailing_schedule_params
      params.require(:mailing_schedule).permit(:name, :template_id, :city_hall_id, :date, :content, :snapshot)
    end

    def upload_image(model)
      html  = render_to_string('mailing_schedules/preview' ,:layout => false)
      kit   = IMGKit.new(html)
      img   = kit.to_img(:png)
      file  = Tempfile.new(["template_#{model.id}", '.png'], 'tmp',
                         :encoding => 'ascii-8bit')
      file.write(img)
      file.flush
      model.snapshot = file
      model.save!
      file.unlink
    end
end
