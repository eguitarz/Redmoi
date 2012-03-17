# sample datas

admin = User.first

Gather.delete_all

gather = Gather.create( [ :title => 'Test page', :url => 'http://google.com' ])
gather.user = admin
gather.save

gather = Gather.create( [ :title => 'Test page 2', :url => 'http://ruby.tw' ])
gather.user = admin
gather.save

