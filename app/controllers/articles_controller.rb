class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    
  end

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article saved successifully"
    else
      render 'new'
    end
  end

  def update
    
    if @article.update(article_params)
      redirect_to @article, notice: "Article updated successifully"
    else
      render 'edit'
    end
  end

  def destroy
    
    @article.destroy
    redirect_to articles_path, notice: "Article '#{@article.title}' deleted successifully"
    
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.expect(article: [:title, :description])
  end


end