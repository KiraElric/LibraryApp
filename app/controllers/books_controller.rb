class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_genres, :set_languages, :set_publishers, only: %i[ new edit ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_genres #De esta forma traemos la lista del campo genrer del modelo Book en el controlador y por medio de la variable la llamamos en la vista.
      @genres = Book.genres.map {|k,v| [k, v]}
    end

    def set_languages #De esta forma traemos la lista del campo language del modelo Book en el controlador y por medio de la variable la llamamos en la vista.
      @languages = Book.languages.map {|k,v| [k, v]} #Languages al ser un atributo de libro, es una colección de valores posibles para este basada en un enum, por lo que lo lleva a un arreglo por medio de un map
    end

    def set_publishers #De esta forma traemos la lista del modelo publisher en el controlador y por medio de la variable la llamamos en la vista.
      #@publishers = Publisher.all.map {|p| [p.name, p.id]}
      @publishers = Publisher.pluck(:name, :id)#Publisher al ser un modelo, una coleccion de ActiveRecord, con pluck se hace un ordenamiento según los valores que se desean y en la prioridad en que se desea en forma de array (No se puede usar en Arreglos)
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :isbn, :stock, :edition_number, :genre, :language, :pages, :publisher_id)
    end
end
