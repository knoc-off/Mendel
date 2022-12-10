{ pkgs, ... }:
let
  helix_config = { pkgs, ... }: {
    programs.helix = {
      enable = true;
      settings = {
        theme = "dark_plus_plus"; #"#dark_plus";
        # base16_default_dark
        # monokai_pro
        # dark_plus
        # gruvbox 

        # editor.whitespace.render = {
            # space = "all";
            # tab = "all";
            # newline = "none";
        # };

        #  editor.whitespace.characters = {
        #     space = "·";
        #     nbsp = "⍽";
        #     tab = "→";
        #     newline = "⏎";
        #     tabpad = "·";

        #   };

        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";

        };
        editor = {
          scroll-lines = 1;
          mouse = true;
          idle-timeout = 100;
          true-color = true; # should maybe disable 
          # statusline = {
          #   left = [ "mode" "spinner" ];
          #   center = [ "file-name" "position" "position-percentage" ];
          #   right = [ "diagnostics" "selections" "file-encoding" "file-line-ending" "file-type" ];
          #   separator = "│";
          # };
        };

        keys.normal = {
          space.space = "file_picker";
          space.w = ":w";
          space.q = ":q";
          C-v = ":clipboard-paste-before";
          #C-c = ":primary-clipboard-yank";

          # S-x = "extend_line_above";
        };
        keys.insert = {
          C-v = ":clipboard-paste-before";
          C-c = ":primary-clipboard-yank";

        };
      };

      languages = [
        {
          name = "rust";
          indent = {
            tab-width = 2;
            unit = " ";
          };
        }
        {
          name = "nix";
          indent = {
            tab-width = 2;
            unit = " ";
          };
        }
        {
          name = "lua";
          indent = {
            tab-width = 2;
            unit = " ";
          };
          language-server = {
            command = "lua-language-server";
            # args = ["--stdio"]; 
          };
        }
      ];
      themes = {
        dark_plus_plus =
          let
            white = "#ffffff";
            orange = "#ce9178";
            gold = "#d7ba7d";
            gold2 = "#cca700";
            pale_green = "#b5cea8";
            dark_green = "#6A9955";
            dark_green2 = "#487e02";
            light_gray = "#d4d4d4";
            light_gray2 = "#c6c6c6";
            light_gray3 = "#eeeeee";
            dark_gray = "#858585";
            dark_gray2 = "#1e1e1e";
            dark_gray3 = "#282828";
            dark_gray4 = "#404040";
            blue = "#0061A3"; #"#007acc";
            blue2 = "#569CD6";
            blue3 = "#6796E6";
            blue4 = "#1b81a8";
            light_blue = "#75beff";
            dark_blue = "#264f78";
            dark_blue2 = "#094771";
            red = "#ff1212";
            orange_red = "#f14c4c";

            type = "#4EC9B0";
            special = "#C586C0";
            variable = "#9CDCFE";
            fn_declaration = "#DCDCAA";
            constant = "#4FC1FF";

            background = "#1e1e1e";
            text = "#d4d4d4";
            cursor = "#a6a6a6";
            widget = "#252526";
            borders = "#323232";
          in
          {
            "namespace" = { fg = type; };
            "module" = { fg = type; };

            "type" = { fg = type; };
            "type.builtin" = { fg = type; };
            "type.enum.variant" = { fg = constant; };
            "constructor" = { fg = type; };
            "variable.other.member" = { fg = variable; };

            "keyword" = { fg = blue2; };
            "keyword.directive" = { fg = blue2; };
            "keyword.control" = { fg = special; };
            "label" = { fg = blue2; };
            "tag" = blue2;

            "special" = { fg = text; };
            "operator" = { fg = text; };

            "punctuation" = { fg = text; };
            "punctuation.delimiter" = { fg = text; };

            "variable" = { fg = variable; };
            "variable.parameter" = { fg = variable; };
            "variable.builtin" = { fg = blue2; };
            "constant" = { fg = constant; };
            "constant.builtin" = { fg = blue2; };

            "function" = { fg = fn_declaration; };
            "function.builtin" = { fg = fn_declaration; };
            "function.macro" = { fg = blue2; };
            "attribute" = { fg = fn_declaration; };

            "comment" = { fg = dark_green; };

            "string" = { fg = orange; };
            "constant.character" = { fg = orange; };
            "string.regexp" = { fg = gold; };
            "constant.numeric" = { fg = pale_green; };
            "constant.character.escape" = { fg = gold; };

            "markup.heading" = { fg = blue2; modifiers = [ "bold" ]; };
            "markup.list" = blue3;
            "markup.bold" = { fg = blue2; modifiers = [ "bold" ]; };
            "markup.italic" = { modifiers = [ "italic" ]; };
            "markup.link.url" = { modifiers = [ "underlined" ]; };
            "markup.link.text" = orange;
            "markup.quote" = dark_green;
            "markup.raw" = orange;

            "diff.plus" = { fg = dark_green2; };
            "diff.delta" = { fg = blue4; };
            "diff.minus" = { fg = orange_red; };

            "ui.background" = { fg = light_gray; bg = dark_gray2; };

            "ui.window" = { bg = widget; };
            "ui.popup" = { fg = text; bg = widget; };
            "ui.help" = { fg = text; bg = widget; };
            "ui.menu" = { fg = text; bg = widget; };
            "ui.menu.selected" = { bg = blue2; };

            "ui.cursor" = { fg = cursor; modifiers = [ "reversed" ]; };
            "ui.cursor.primary" = { fg = cursor; modifiers = [ "reversed" ]; };
            "ui.cursor.match" = { bg = "#3a3d41"; modifiers = [ "underlined" ]; };

            "ui.selection" = { bg = "#3a3d41"; };
            "ui.selection.primary" = { bg = dark_blue; };

            "ui.linenr" = { fg = dark_gray; };
            "ui.linenr.selected" = { fg = light_gray2; };

            "ui.cursorline.primary" = { bg = dark_gray3; };
            "ui.statusline" = { fg = white; bg = blue; };
            "ui.statusline.inactive" = { fg = white; bg = blue; };
            "ui.statusline.insert" = { fg = white; bg = "yellow"; };
            "ui.statusline.select" = { fg = white; bg = "magenta"; };

            "ui.bufferline" = { fg = text; bg = widget; };
            "ui.bufferline.active" = { fg = white; bg = blue; };
            "ui.bufferline.background" = { bg = "background"; };

            "ui.text" = { fg = text; };
            "ui.text.focus" = { fg = white; };

            "ui.virtual.whitespace" = { fg = dark_gray; };
            "ui.virtual.ruler" = { bg = borders; };
            "ui.virtual.indent-guide" = { fg = dark_gray4; };

            "warning" = { fg = gold2; };
            "error" = { fg = red; };
            "info" = { fg = light_blue; };
            "hint" = { fg = light_gray3; };

            "diagnostic.error".underline = { color = red; style = "curl"; };
            "diagnostic".underline = { color = gold; style = "curl"; };

          };


      };
    };
  };
in
{
  home-manager.users.niko = helix_config;
  home-manager.users.root = helix_config;
}
