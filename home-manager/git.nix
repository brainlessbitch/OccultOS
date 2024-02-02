let
  name = "Winter";
  email = "a2405392127a@gmail.com";
in {
    programs.git = {
        enable = true;
        userName = name;
        userEmail = email;
      };
  }
