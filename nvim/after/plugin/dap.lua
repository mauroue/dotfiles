local dap = require('dap')
dap.adapters.python = function(cb, config)
    ---@diagnostic disable-next-line: undefined-field
    local port = 3000
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
end

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'attach';
        name = "Attach";
        port = 3000;
        host = '127.0.0.1';
        pathMappings={{
            localRoot = vim.fn.getcwd();
            remoteRoot = "/www_root";
        }};
    },
}
