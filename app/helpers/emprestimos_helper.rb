module EmprestimosHelper
    # Se aluno não existe não banco dados ou um livro uma messagem informativa e lançada para o usuario
    def validar_dados(emprestimo)
        if !Aluno.where(matricula: emprestimo.matricula).exists?
            @error = "Matricula incorreta ou não cadastrada." 
            true
        elsif !Livro.where(codigo: emprestimo.codigo).exists?
            @error = "Codigo incorreto ou não cadastrado." 
            true
        elsif emprestimo.data_devoluncao.nil?
            @error = "Selecione uma data para devolução." 
            true
        else
            false
        end
    end
    
    def finalizar_dados(emprestimo)
         # Pesquisa no banco da dados aluno e livro com o numero da matricula do aluno e codigo do livro 
         aluno = Aluno.where(matricula: @emprestimo.matricula).first
         livro = Livro.where(codigo: @emprestimo.codigo).first
 
         # Emprestimo aluno e livro recebe os valores do aluno nome e livro titulo e data do emprestimo receber data atual
         @emprestimo.aluno_nome = aluno.nome
         @emprestimo.livro_titulo = livro.titulo
         @emprestimo.data_emprestimo = Time.now.strftime("%Y-%m-%d")
         @emprestimo.aluno = aluno
         @emprestimo.livro = livro
    end

    def gerar_pdfs(emprestimo)
        respond_to do |format|
            format.html
            format.pdf do
              pdf = EmprestimosPdf.new(emprestimo)
              send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
    end
end
