inst_vars = %w[puuid region name tag account_level card last_update last_update_raw]

inst_vars.each do |var|
    puts "it '@#{var} should return a string' do"
    puts "    expect(user.#{var}).to be_a(String)"
    puts "end"
    puts
end