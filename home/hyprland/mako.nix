{pkgs, ...}: {
  # home.packages = [pkgs.libnotify];

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-radius = 6;
      margin = 12;
      icons = true;
    };
  };
}
