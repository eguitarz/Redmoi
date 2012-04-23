File.open('mock.gif', 'wb') do |f|
  width = 1 & 0xFF
  height = 1 & 0xFF
  output = []
  output << 'G' << 'I' << 'F' << '8' << '9' << 'a' << width << 0
  output << height << 0 << 0x0 << 0 << 0 << 0x2c << 0 << 0
  output << 0 << 0 << width << 0 << height << 0 << 0 << 0x3b

  output.each do |b|
    f.write(b.chr)
  end
end
