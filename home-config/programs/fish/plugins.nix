{ pkgs }:

let
  bobthefish = {
    name = "bobthefish";
    src = pkgs.fetchFromGitHub {
      owner  = "oh-my-fish";
      repo   = "theme-bobthefish";
      rev    = "a2ad38aa051aaed25ae3bd6129986e7f27d42d7b";
      sha256 = "1fssb5bqd2d7856gsylf93d28n3rw4rlqkhbg120j5ng27c7v7lq";
    };
  };
in
{ 
  theme = bobthefish;
  prompt = builtins.readFile "${bobthefish.src.out}/fish_prompt.fish";
}
