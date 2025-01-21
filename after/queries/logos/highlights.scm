; inherits objc

[
 "%hook"
 "%end"
 "%orig"
 "%c"
 "%config"
 "%ctor"
 ] @keyword.directive

(logos_config
  key: _ @field
  value: _ @constant
  )
(logos_hook
  identifier: (identifier) @type
  )
(logos_c
  (identifier) @type
  )
