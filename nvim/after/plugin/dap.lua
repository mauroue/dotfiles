local dap = require("dap")
local dapvt = require("nvim-dap-virtual-text")

dapvt.setup()

dap.adapters.python = function(cb, config)
    local port = 3000
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
        name = "Attach Remote";
        connect = function ()
            local host = vim.fn.input('Host [127.0.0.1]: ')
            host = host ~= '' and host or '127.0.0.1'
            local port = tonumber(vim.fn.input('Port [3000]: ')) or 3000
            return {host = host, port = port}
        end;
        pathMappings={{
            localRoot = vim.fn.getcwd();
            remoteRoot = "/www_root";
        }};
    },
}
