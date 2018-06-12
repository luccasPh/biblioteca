class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy]

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @emprestimos = Emprestimo.all.page params[:page]
    gerar_pdfs(@emprestimos)
  end

  # GET /emprestimos/1
  # GET /emprestimos/1.json
  def show
  end

  # GET /emprestimos/new
  def new
    @emprestimo = Emprestimo.new
  end

  # GET /emprestimos/1/edit
  def edit
  end
  
  # POST /emprestimos
  # POST /emprestimos.json
  def create
    @emprestimo = Emprestimo.new(emprestimo_params)

    respond_to do |format|
      if validar_dados(@emprestimo)
        format.html { redirect_to new_emprestimo_path, alert: @error }
        format.json { head :no_content }
      else
        finalizar_dados(@emprestimo)
        if @emprestimo.save
          format.html { redirect_to @emprestimo, notice: 'Emprestimo foi cadastrado com sucesso.' }
          format.json { render :show, status: :created, location: @emprestimo }
        else
          format.html { render :new }
          format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  # PATCH/PUT /emprestimos/1
  # PATCH/PUT /emprestimos/1.json
  def update
    respond_to do |format|
      if validar_dados(@emprestimo)
        format.html { redirect_to new_emprestimo_path, alert: @error }
        format.json { head :no_content }
      else
        finalizar_dados(@emprestimo)

        if @emprestimo.update(emprestimo_params)
          format.html { redirect_to @emprestimo, notice: 'Emprestimo foi atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @emprestimo }
        else
          format.html { render :edit }
          format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /emprestimos/1
  # DELETE /emprestimos/1.json
  def destroy
    @emprestimo.destroy
    respond_to do |format|
      format.html { redirect_to emprestimos_url, notice: 'Livro devolvido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_params
      params.require(:emprestimo).permit(:aluno_nome, :matricula, :livro_titulo, :codigo, :data_emprestimo, :data_devoluncao, :aluno_id, :livro_id)
    end
end
