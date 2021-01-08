class NewsItemsController < ApplicationController
  before_action :ensure_admin
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  def index
    @news_items = NewsItem.all
  end

  def show
  end

  def new
    @news_item = NewsItem.new
  end

  def edit
  end

  def create
    @news_item = NewsItem.new(news_item_params)

    respond_to do |format|
      if @news_item.save
        @news_item.save
        format.html { redirect_to news_items_path, notice: 'news_item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @news_item.update(news_item_params)
        @news_item.save
        format.html { redirect_to news_items_path, notice: 'news_item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @news_item.destroy
    respond_to do |format|
      format.html { redirect_to news_items_url, notice: 'news_item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
      @news_item = NewsItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_item_params
      params.require(:news_item).permit(:posted_date, :title, :body, :picture, :is_book, :is_news, :piclink)
    end
end
