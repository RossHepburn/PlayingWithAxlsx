class ArticlesController < ApplicationController

  def index
    @articles = Article.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @articles }
      format.xlsx { render axlsx: "articles", locals: { xlsx_use_shared_strings: true } }
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end

    def update
      @article - Article.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
