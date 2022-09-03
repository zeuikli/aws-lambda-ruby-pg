load_paths = Dir["./vendor/bundle/ruby/2.7.0/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)

require 'json'
require 'pg'
require 'sequel'

def main(event:, context:)
  {
    postgres_client_version: PG.library_version
  }
end
