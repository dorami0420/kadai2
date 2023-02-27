class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
 def create
   book = Book.new(book_params)
    book.save
 redirect_to '/top'
 end
  
  def index
    @books = Book.all

    
    flash[:notice] = "投稿が成功しました"
    redirect_to book_path(book.id)
  end


    def show
        @books = Book.find(params[:id])
    end

  def edit
     @book = Book.find(params[:id])
  end
   
     def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
     end
    
    def destroy
      book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'
    end
  
     private
     
  def book_params
    params.require(:book).permit(:title, :body)
  end
end