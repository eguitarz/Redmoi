# Default setting for general scope
Settings.cache = ActiveSupport::Cache::MemoryStore.new
Settings.cache_options = { :expires_in => 5.minutes }
Settings.article_limit = 50
