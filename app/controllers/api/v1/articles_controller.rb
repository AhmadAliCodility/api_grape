class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.order('created_at DESC')
    render json: { status: "Success", msg: "Loaded Articles", data: articles }, status: :ok
  end

  def show
    article = Article.find(params[:id])
    render json: { status: "Success", msg: "Loaded Article", data: article }, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: { status: "Success", msg: "Saved Article", data: article }, status: :ok
    else
      render json: { status: "Error", msg: "Article Not Saved", data: article.errors }, status: :unprocessable_entity
    end
  end


  def destroy
    article = Article.find(params[:id])
    article.destroy
    render json: { status: "Success", msg: "Article Deleted Successfully", data: article }, status: :ok
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: { status: "Success", msg: "Updated Article", data: article }, status: :ok
    else
      render json: { status: "Error", msg: "Article Not Updated", data: article.errors }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end

