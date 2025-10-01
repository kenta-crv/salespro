class RecruitsController < ApplicationController
  def index
    @q = Recruit.ransack(params[:q])
    @recruits = @q.result
    @recruits = @recruits.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    if @recruit.save
      redirect_to recruits_path
    else
      render :new
    end
  end

  def edit
    @recruit = Recruit.find(params[:id]) # 必要に応じて設定
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(Recruit_params)
        redirect_to recruit_path
    else
        render :edit
    end
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @Recruit.destroy
    redirect_to recruit_path# または適切なパスに変更
  end

  private

 def recruit_params
  params.require(:recruit).permit(
      :title,
      :work_contents,
      :salary,
      :genre,
      :work_time,
      :day_off,
      :address,
      :traning,
      :qualification,
      :other,
      :visa,
      :employment,
      :traning_salary,
  )
  end
end
