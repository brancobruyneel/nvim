{ nixpkgs }:
{
  nvim =
    { ... }:
    {
      settings = {
        configDirName = "nvim";
        wrapRC = false;
      };
      categories = {
        debug = true;
        general = true;
        lang = true;
        theme = true;
        tools = true;
      };
      extra = {
        nixdExtras = { inherit nixpkgs; };
      };
    };
}
