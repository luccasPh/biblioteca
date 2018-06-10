class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy]

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @emprestimos = Emprestimo.all.page params[:page]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EmprestimosPdf.new(@emprestimos)
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
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
      # Se aluno não existe não banco dados ou um livro uma messagem informativa e lançada para o usuario
      if !Aluno.where(matricula: @emprestimo.matricula).exists?
        format.html { redirect_to new_emprestimo_path, alert: "Matricula incorreta ou não cadastrada." }
        format.json { head :no_content }
      elsif !Livro.where(codigo: @emprestimo.codigo).exists?
        format.html { redirect_to new_emprestimo_path, alert: "Codigo incorreto ou não cadastrado." }
        format.json { head :no_content }
      elsif @emprestimo.data_devoluncao.nil?
        format.html { redirect_to new_emprestimo_path, alert: "Selecione uma data para devolução." }
        format.json { head :no_content }
      else
        # Pesquisa no banco da dados aluno e livro com o numero da matricula do aluno e codigo do livro 
        aluno = Aluno.where(matricula: @emprestimo.matricula).first
        livro = Livro.where(codigo: @emprestimo.codigo).first

        # Emprestimo aluno e livro recebe os valores do aluno nome e livro titulo e data do emprestimo receber data atual
        @emprestimo.aluno = aluno.nome
        @emprestimo.livro = livro.titulo
        @emprestimo.data_emprestimo = Time.now.strftime("%Y-%m-%d")

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
      if @emprestimo.update(emprestimo_params)
        format.html { redirect_to @emprestimo, notice: 'Emprestimo foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
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
      params.require(:emprestimo).permit(:aluno, :matricula, :livro, :codigo, :data_emprestimo, :data_devoluncao)
    end
end
