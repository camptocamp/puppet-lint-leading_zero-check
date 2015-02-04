PuppetLint.new_check(:leading_zero) do
  def check
    tokens.each_with_index do |token, token_idx|
      if token.type == :NUMBER and token.value =~ /^0/
        notify :warning, {
          :message => 'unquoted number with leading zero',
          :line    => token.line,
          :column  => token.column,
          :token   => token,
        }
      end
    end
  end

  def fix(problem)
    problem[:token].type = :SSTRING
  end
end