module AlunosHelper
    def validar_dados(aluno)
        #Verifica se todos os campos foram prenchido
        if aluno.nome.empty? || aluno.matricula.nil? || aluno.email.empty? || aluno.telefone.empty?
            @error = "Todos os campos devem ser preenchido." 
            true
        #Verifica se a matricula esta correta
        elsif aluno.matricula.digits.count < 7
            @error = "Matricula incorreta." 
            true
        #Verifica se o aluno já esta cadastrado
        elsif Aluno.where(matricula: aluno.matricula).exists?
            @error = "Aluno já cadastrado no sistema." 
            true
        else
            false
        end
    end

    def gera_pdf(aluno)
        respond_to do |format|
            format.html
            format.pdf do
              pdf = AlunosPdf.new(aluno)
              send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
    end
end
