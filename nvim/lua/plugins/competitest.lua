return {
  {
	  'xeluxee/competitest.nvim',
    lazy=false,
	  dependencies = 'MunifTanjim/nui.nvim',
	  config = function() require('competitest').setup{
      compile_command = {
          cpp = {
              exec = "g++",
              args = {
                  "-Wall",
                  "-I$(HOME)/Projects/cp/algo/", 
                  "-DDEBUG",
                  "$(FNAME)",
                  "-o",
                  "$(FNOEXT)"
              }
          },
      },
      template_file = "$(HOME)/Projects/cp/templates/template.cpp",
      evaluate_template_modifiers = true,
    } end,
  }
}
