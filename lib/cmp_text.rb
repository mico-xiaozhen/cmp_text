require "cmp_text/version"

module CmpText
  class Analysis
    class << self
      attr_accessor :log_text

      def open(file)
        File.file?(file) ? File.open(file).read.chomp.strip.gsub(/'/, '') : file.to_s.dup
      end

      def txt_cmp(f0, f1)
        str_f0, str_f1 = open(f0), open(f1)

        @log_text = {
          or_text_1: str_f0.dup,
          or_text_2: str_f1.dup,
          succ_char:[],
          failed_char: []
        }

        arr_f0_each_char = str_f0.dup.split('')
        arr_f1_each_char = str_f1.dup.split('')
        str_f0_size = str_f0.dup.size
        str_f1_size = str_f1.dup.size

        arr_f0_each_char.each_with_index do |char, index|
          cmp = false
          break if [arr_f0_each_char.size, arr_f1_each_char.size].any?{|size| size == 0}
          to_index = index

          while str_f1.include?(char) do
            if [str_f0_size, str_f1_size].min < (to_index + 1)
              cmp = true
              break
            end
            to_index += 1
            char = arr_f0_each_char[index..to_index].join
          end

          to_index -= 1 unless [str_f0_size, str_f1_size].min == (to_index + 1) && cmp
          if (to_index - index) > 0 || (to_index - index == 0 && ([str_f0_size,   str_f1_size].min == 1))
            succ_char = arr_f0_each_char.slice!(index..to_index).join
            arr_f0_each_char.unshift(nil)
            arr_f1_each_char = arr_f1_each_char.join.sub(succ_char,'').split
            @log_text[:succ_char] << succ_char
          end
        end

        @log_text[:failed_char] << arr_f1_each_char.join << arr_f0_each_char.join
        @log_text[:failed_char].delete('')

        "#{(
            (@log_text[:succ_char].join.size.to_f / [ @log_text[:or_text_1].size.to_f, @log_text[:or_text_2].size.to_f].max ) * 100
          ).round(3)
        }%".strip
      end
    end
  end
end




