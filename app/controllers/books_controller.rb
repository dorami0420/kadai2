class BooksController < ApplicationController
  def top
 redirect_to book_path(book.id)
  end

 def create
   book = Book.new(book_params)
    book.save

    flash[:notice] = "投稿が成功しました"
 redirect_to book_path(book.id)


 end

  def index
    @books = Book.all
    @book = Book.new


  end


    def show
        @book = Book.find(params[:id])
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