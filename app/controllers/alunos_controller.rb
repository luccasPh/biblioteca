class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.all.page params[:page]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AlunosPdf.new(@alunos)
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)
    puts @aluno.matricula.digits.count
    puts @aluno.matricula.class

    respond_to do |format|
      #Verifica se todos os campos foram prenchido
      if @aluno.nome.empty? || @aluno.matricula.nil? || @aluno.email.empty? || @aluno.telefone.empty?
        format.html { redirect_to new_aluno_path, alert: "Todos os campos devem ser preenchido." }
        format.json { head :no_content }
      #Verifica se a matricula esta correta
      elsif @aluno.matricula.digits.count < 7
        format.html { redirect_to new_aluno_path, alert: "Matricula incorreta." }
        format.json { head :no_content }
      #Verifica se o aluno já esta cadastrado
      elsif Aluno.where(matricula: @aluno.matricula).exists?
        format.html { redirect_to new_aluno_path, alert: "Aluno já cadastrado no sistema." }
        format.json { head :no_content }
      else
        if @aluno.save
          format.html { redirect_to @aluno, notice: 'Aluno foi cadastrado com sucesso.' }
          format.json { render :show, status: :created, location: @aluno }
        else
          format.html { render :new }
          format.json { render json: @aluno.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Aluno foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:nome, :matricula, :email, :telefone)
    end
end
