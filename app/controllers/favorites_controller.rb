class FavoritesController < ApplicationController

  def create
    @book_favorite = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: params[:book_id])
    favorite.save
  end

  def destroy
    @book_favorite= Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    favorite.destroy
  end


end
