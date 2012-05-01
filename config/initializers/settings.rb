# Default setting for general scope
Settings.defaults[:cache] = ActiveSupport::Cache::MemoryStore.new
Settings.defaults[:cache_options] = { :expires_in => 5.minutes }
Settings.defaults[:article_limit] = 50
