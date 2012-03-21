# sample datas

admin = User.first

Gather.delete_all

gather = Gather.create :title => 'Google History', :url => 'http://www.google.com/intl/en/about/company/history.html'
gather.user = admin
gather.save

gather = Gather.create  :title => 'Ruby TW', :url => 'http://ruby.tw'
gather.user = admin
gather.save

