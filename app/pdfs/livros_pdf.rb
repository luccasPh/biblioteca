class LivrosPdf < Prawn::Document
    def initialize(livros)
        super(top_margin: 70)
        @livro = livros
        line_items     
    end

    def line_items
        move_down 20
        text "Data #{Time.now.strftime("%d/%m/%Y")}"
        table line_item_rows do
            row(0).font_style = :bold
            columns(1..3).align = :left
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
            column(0).width = 10
            self.cell_style = {:size => 10,:width => 180}
        end
    end

    def line_item_rows
        [["Titulo", "Autor", "Codigo"]] + 
        @livro.map do |item|
            [item.titulo, item.autor, item.codigo]
        end
    end
end