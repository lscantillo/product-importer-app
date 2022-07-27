# frozen_string_literal: true

module CsvService
  class CleanCsv
    require 'csv'

    def self.clean_file(_csv_path, random_name)
      csv_in = CSV.read(_csv_path, headers: true, liberal_parsing: true, col_sep: ';')
      CSV.open(random_name, 'w', col_sep: '|', quote_char: '\'', force_quotes: false) do |csv_out|
        csv_out << csv_in.first.headers

        csv_in.each do |line|
          clean = Sanitize.clean(line['name'], elements: %w[a b blockquote br em i img li ol p span strong ul table td tr], add_attributes: { 'table' => { 'width' => '100%', 'border' => '1',
                                                                                                                                                           'bordercolor' => '#dfdede', 'cellpadding' => '0', 'cellspacing' => '0' } })

          clean.gsub!(/\n/, '')
          line['name'] = clean
          csv_out << line.fields
        end
      end
    end
  end
end
