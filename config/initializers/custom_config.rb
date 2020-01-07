SF_CONFIG = ExecJS.eval(File.read(Rails.root.join('db', 'seeds', 'config.json')))

APP_CONFIG = YAML.load_file(Rails.root.join('config', 'config.yml'))[Rails.env]
