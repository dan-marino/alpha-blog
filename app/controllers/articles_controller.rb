class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = User.first.id # TODO: change hardcoded user
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render new_article_path
    end
  end

  def edit
    @article.user_id = User.first.id # TODO: change hardcoded user
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render new_article_path
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
