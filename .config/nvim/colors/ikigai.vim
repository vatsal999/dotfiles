lua << EOF
package.loaded['ikigai'] = nil
package.loaded['ikigai.util'] = nil
package.loaded['ikigai.colors'] = nil
package.loaded['ikigai.theme'] = nil
package.loaded['ikigai.functions'] = nil

require('ikigai').setup()
EOF
