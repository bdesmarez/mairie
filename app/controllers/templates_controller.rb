class TemplatesController < ApplicationController
  
  # after_action :verify_authorized, except: [:show]
  before_action :set_template, only: [:show, :edit, :update, :destroy, :preview]
  
  # before_update :upload_image
  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
    authorize @templates
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
    authorize @template
  end

  # GET /templates/1/edit
  def edit
    authorize @template
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)
    authorize @template
    respond_to do |format|
      if @template.save
        upload_image(@template)
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def preview
    render layout: false 
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    authorize @template
    respond_to do |format|
      if @template.update(template_params)
        upload_image(@template)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    authorize @template
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :body, :snapshot)
    end

    def upload_image(model)
      html  = render_to_string('templates/preview' ,:layout => false)
      kit   = IMGKit.new(html)
      img   = kit.to_img(:png)
      file  = Tempfile.new(["template_#{model.id}", '.png'], 'tmp',
                         :encoding => 'ascii-8bit')
      file.write(img)
      file.flush
      model.snapshot = file
      model.save!
      logger.info "Model : " + model.inspect + " -----"
      file.unlink
    end
end
