class EmprestimosPdf < Prawn::Document
    def initialize(emprestimos)
        super(top_margin: 70)
        @emprestimo = emprestimos
        line_items     
    end

    def line_items
        move_down 20
        text "Data da consuta #{Time.now.strftime("%d/%m/%Y")}"
        table line_item_rows do
            row(0).font_style = :bold
            columns(1..6).align = :left
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
            column(0).width = 10
            self.cell_style = {:size => 9,:width => 90}
        end
    end

    def line_item_rows
        [["Aluno", "Matricula", "Livro", "Codigo", "Data do emprestimo", "Data da devolução"]] + 
        @emprestimo.map do |item|
            [item.aluno_nome, item.matricula, item.livro_titulo, item.codigo, item.data_emprestimo.strftime("%d/%m/%Y"), item.data_devoluncao.strftime("%d/%m/%Y")]
        end
    end
end