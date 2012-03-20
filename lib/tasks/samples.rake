namespace :db do

    desc "sample datas for dev from db/samples.rb"
    task :sample => :environment do
      sample_file = File.join(Rails.root, 'db', 'samples.rb')
      load(sample_file) if File.exist?(sample_file)
    end

end
