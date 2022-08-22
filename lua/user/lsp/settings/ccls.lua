return {
	settings = {
	  require'lspconfig'.ccls.setup{
      init_options = {
        compilationDatabaseDirectory = "build";
        index = {
          threads = 0;
        };
        clang = {
          excludeArgs = { "-frounding-math"} ;
        };
      }
    }
  },
}
