-- Global objects
globals = {
  'PV',
  'pocketnvim_installation',
  'nvim',
  'vim',
  'bit',
  'autogroup',
  'ui',
}

-- Rerun tests only if their modification time changed
cache = true

-- Don't report unused self arguments of methods
self = false

ignore = {
  '631', -- max_line_length
  '212/_.*', -- unused argument, for vars with "_" prefix
}
